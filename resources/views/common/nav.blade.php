<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <audio id="mysound" src="{{asset('panel/sound/not-bad.mp3')}}" allow="autoplay"></audio>

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Navbar -->
    @if(App::isLocale('en')) <ul class="navbar-nav ml-auto"> @else <ul class="navbar-nav mr-auto"> @endif
        @if(auth()->guard('admin')->user()->type == 5)
        <!-- Nav Item - Messages -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span id="messageCount" class=""></span>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown" style="border-radius: 0 0 10px 10px;">
                <h6 class="dropdown-header">
                    {{trans('admin.messages')}}
                </h6>
                @foreach(messageContact() as $contact)
                <div class="dropdown-item d-flex align-items-center">
                    <div class="font-weight-bold">
                        <div class="text-truncate">{{$contact->contact_message}}</div>
                        <div class="small text-gray-500">{{$contact->contact_name}}</div>
                    </div>
                </div>
                @endforeach
                <a href="{{url(route('contacts'))}}" class="dropdown-item text-center small text-gray-500">{{trans('admin.read more')}}</a>
            </div>
        </li>
        @endif

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{getName()}}</span>
                <img class="img-profile rounded-circle" src="{{asset(auth()->guard('admin')->user()->image)}}">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                @if(auth()->guard('admin')->user()->type == 5)
                <a class="dropdown-item" href="{{url(route('edit_profile', auth()->guard('admin')->user()->id))}}">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    {{trans('admin.profile')}}
                </a>
                <div class="dropdown-divider"></div>
                @endif
                <!--<a class="dropdown-item" href="#">-->
                <!--    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>-->
                <!--    {{trans('admin.setting')}}-->
                <!--</a>-->
                
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    {{trans('admin.logout')}}
                </a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{trans('admin.language')}}</span><i class="fas fa-globe"></i>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="{{asset('lang/en')}}">
                    {{trans('admin.english')}}
                </a>
                <a class="dropdown-item" href="{{asset('lang/ar')}}">
                    {{trans('admin.arabic')}}
                </a>
            </div>
        </li>

    </ul>

</nav>
<!-- End of Topbar -->
