{{-- Controller Alert Scripts [ SweetAlert ] --}}
<script>
    @if(Session::has('message'))
    const type = "{{ Session::get('alert-type', 'message') }}";
    switch(type){
        case 'success_toast':
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
                icon: 'success',
                title: "{{ Session::get('message') }}"
            })
            break
        case 'warning_toast':
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
                icon: 'warning',
                title: "{{ Session::get('message') }}"
            })
            break
    }
    @endif
</script>
