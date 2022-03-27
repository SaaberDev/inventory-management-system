{{-- SweetAlert Deleting --}}
<script>
    $('.sweet_delete').on('click', function (event) {
        event.preventDefault();
        Swal.fire({
            title: "Are you sure ?",
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#17a2b8',
            cancelButtonColor: 'rgb(204 75 75)',
            background: '#ffffff',
            confirmButtonText: 'Yes, delete it!',
        })
            .then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: $(this).attr('href'),
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        method: 'DELETE',
                        success: function(data) {
                            const SuccessToast = Swal.mixin({
                                toast: true,
                                // position: 'bottom-left',
                                position: 'top-right',
                                showConfirmButton: false,
                                showCloseButton: true,
                                timer: 1500,
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
                                // background: '#E9EFE8'
                                background: '#ffffff',
                                // iconColor: '#17a2b8'
                            })
                            SuccessToast.fire({
                                icon: data.alert_type,
                                title: data.message
                            })
                            Livewire.emit('refreshTable');
                        },
                        error: function(data) {
                            const WarningToast = Swal.mixin({
                                toast: true,
                                // position: 'bottom-left',
                                position: 'top-right',
                                showConfirmButton: false,
                                showCloseButton: true,
                                timer: 1500,
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
                                // background: '#E9EFE8'
                                background: '#ffffff'
                            })
                            WarningToast.fire({
                                icon: data.alert_type,
                                title: data.message
                            })
                        }
                    });
                }
                return false;
            })
    });
</script>
