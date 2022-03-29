<script>
    Dropzone.prototype.isFileExist = function (file) {
        var i;
        if (this.files.length > 0) {
            for (i = 0; i < this.files.length; i++) {
                if (this.files[i].name === file.name
                    && this.files[i].size === file.size
                    && this.files[i].lastModifiedDate.toString() === file.lastModifiedDate.toString()) {
                    return true;
                }
            }
        }
        return false;
    };

    // Dropzone Service Image
    var multipleUploadMap = {}
    Dropzone.options.{{ $dropzone }} = {
        url: "{{ $store }}",
        maxFilesize: '{{ $maxFilesize }}', // MB
        acceptedFiles: '{{ $acceptedFiles }}',
        maxFiles: '{{ $maxFiles }}',
        addRemoveLinks: true,
        thumbnailWidth: 120,
        thumbnailHeight: 120,
        thumbnailMethod: 'contain',
        init: function () {
            let myDropzone = this;
            myDropzone.on("addedfile", function(file) {
                $('.dz-image').last().find('img').addClass('dz-thumb');
            });
            // Data fetch
            $.ajax({
                type: 'get',
                url: "{{ $get }}",
                data: {
                    request: '{{ $getRequestParam }}',
                    id: '{{ $model->id }}'
                },
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (key, value) {
                        var mockFile = {
                            id: value.uuid,
                            name: value.name,
                            size: value.size,
                            accepted: true
                        };

                        myDropzone.options.addedfile.call(myDropzone, mockFile);
                        $('.dz-image').find('img').addClass('dz-thumb');

                        $('form').append('<input type="hidden" name="{{ $fileInputName }}[]" value="' + value.file_name + '">');

                        myDropzone.options.thumbnail.call(myDropzone, mockFile, value.original_url);

                        // Make sure that there is no progress bar, etc...
                        myDropzone.emit("complete", mockFile);
                    });
                }
            });
        },
        headers: {
            'X-CSRF-TOKEN': "{{ csrf_token() }}"
        },
        success: function (file, response) {
            $('form').append('<input type="hidden" name="{{ $fileInputName }}[]" value="' + response.name + '">')
            multipleUploadMap[file.name] = response.name
        },
        removedfile: function (file) {

            var name = '';

            if (typeof file.id !== 'undefined') {
                Swal.fire({
                    title: "Are you sure ?",
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: 'rgb(0 0 0)',
                    cancelButtonColor: 'rgb(204 75 75)',
                    background: 'rgb(235 246 236)',
                    confirmButtonText: 'Yes, delete it!',
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Delete media from server and filesystem - ajax
                        $.ajax({
                            type: 'DELETE',
                            url: "{{ $delete }}",
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            data: {
                                {{ $fileInputName }}: file.name,
                                uuid: file.id
                            },
                            success: function (response) {
                                file.previewElement.remove()
                                $('form').find('input[name="{{ $fileInputName }}[]"][value="' + name + '"]').remove()
                            }
                        });
                    }
                    return false;
                })
            } else {
                name = multipleUploadMap[file.name];

                file.previewElement.remove();
                $('form').find('input[name="{{ $fileInputName }}[]"][value="' + name + '"]').remove();
                // Delete preview from filesystem - ajax
                $.ajax({
                    type: 'DELETE',
                    url: "{{ $delete }}",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        {{ $fileInputName }}: name,
                    },
                });
            }
        }
    }


    Dropzone.prototype.addFile = function (file) {
        file.upload = {
            progress: 0,
            total: file.size,
            bytesSent: 0
        };
        if (this.options.preventDuplicates && this.isFileExist(file)) {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-right',
                showConfirmButton: false,
                showCloseButton: true,
                showClass: {
                    popup: 'swal2-show',
                    backdrop: 'swal2-backdrop-show',
                    icon: 'swal2-icon-show',
                },
                hideClass: {
                    popup: 'swal2-hide',
                    backdrop: 'swal2-backdrop-hide',
                    icon: 'swal2-icon-hide'
                },
                customClass: 'swal-toast-height',
                background: 'rgb(244 255 244)'
            })
            Toast.fire({
                icon: 'warning',
                title: this.options.dictDuplicateFile
            })
            return;
        }
        this.files.push(file);
        file.status = Dropzone.ADDED;
        this.emit("addedfile", file);
        this._enqueueThumbnail(file);
        return this.accept(file, (function (_this) {
            return function (error) {
                if (error) {
                    file.accepted = false;
                    _this._errorProcessing([file], error);
                } else {
                    file.accepted = true;
                    if (_this.options.autoQueue) {
                        _this.enqueueFile(file);
                    }
                }
                return _this._updateMaxFilesReachedClass();
            };
        })(this));
    };
</script>
