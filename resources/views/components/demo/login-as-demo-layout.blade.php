<div>
    <div class="row justify-content-center mt-3">
        <div class="col-md-12">
            {{ $slot }}
        </div>
    </div>
</div>

@push('scripts')
    <script>
        $(document).ready(function () {
            $('.login_as').on('click', function () {
                var $_role = $(this).attr('id').replace('login_as_', '');
                $.ajax({
                    url: "{{ route('login_as') }}",
                    type: "POST",
                    data: { param: $_role },
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function (data) {
                        window.location.href = data.redirect
                    }
                });
            });
        });
    </script>
@endpush
