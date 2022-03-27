{{-- Controller Alert Scripts [ SweetAlert ] --}}
<script>
    @if(Session::has('message'))
    const type = "{{ Session::get('alert-type', 'message') }}";
    switch(type){
        case 'success':
            Swal.fire({
                // title:'Successfully Added!',
                text:"{{ Session::get('message') }}",
                icon: "success",
                timer:3000,
            })
            break
        case 'warning':
            Swal.fire({
                // title:'Access Denied',
                text:"{{ Session::get('message') }}",
                icon: "warning",
            })
            break
    }
    @endif
</script>
