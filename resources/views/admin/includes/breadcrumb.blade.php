<ol class="breadcrumb float-sm-left">
    @if(Breadcrumbs::has())
        @foreach (Breadcrumbs::current() as $crumbs)
            @if ($crumbs->url() && !$loop->last)
                <li class="breadcrumb-item">
                    <a href="{{ $crumbs->url() }}">
                        {{ $crumbs->title() }}
                    </a>
                </li>
            @else
                <li class="breadcrumb-item active" aria-current="page">
                    <a>
                        {{ $crumbs->title() }}
                    </a>
                </li>
            @endif
        @endforeach
    @endif
</ol>
