<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{url('/admin')}}">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Reservation</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item {{request()->segment(1) == 'admin' ?'active':''}}">
        <a class="nav-link" href="{{url('/admin')}}">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>{{ trans('admin.dashboard') }}</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        {{trans('admin.interface')}}
    </div>
    @if(auth()->guard('admin')->user()->type == 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/users', 'admin/add_user')?'active':''}}{{request()->segment(2) == 'edit_user'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
            <i class="fas fa-user"></i>
            <span>{{ trans('admin.users') }}</span>
        </a>
        <div id="collapseUser" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/users')?'active':''}}" href="{{url('/admin/users')}}">{{ trans('admin.all user') }}</a>
                <a class="collapse-item {{request()->is('admin/add_user')?'active':''}}" href="{{url('admin/add_user')}}">{{ trans('admin.add user') }}</a>
            </div>
        </div>
    </li>
    @endif
    
    @if(auth()->guard('admin')->user()->type == 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/hospitals', 'admin/add_hospital', 'admin/clinic_hospital/*', 'admin/add_clinic_hospital', 'admin/clinic_doctor/*')?'active':''}}{{request()->is('admin/clinic_doctor_two/*') ?'active':''}}{{request()->segment(2) == 'edit_hospital'?'active':''}}{{request()->segment(2) == 'edit_clinic_hospital'?'active':''}}{{request()->segment(2) == 'reserve_hospital'?'active':''}}{{request()->segment(2) == 'show_reserve_hospital'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseHospital" aria-expanded="true" aria-controls="collapseHospital">
            <i class="fas fa-hospital"></i>
            <span>{{ trans('admin.hospitals') }}</span>
        </a>
        <div id="collapseHospital" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/hospitals')?'active':''}}" href="{{url('admin/hospitals')}}">{{ trans('admin.all hospital') }}</a>
                <a class="collapse-item {{request()->is('admin/add_hospital')?'active':''}}" href="{{url('admin/add_hospital')}}">{{ trans('admin.add hospital') }}</a>
            </div>
        </div>
    </li>
    @elseif(auth()->guard('admin')->user()->type == 1)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/clinic_hospital')?'active':''}}{{request()->is('admin/add_clinic_hospital')?'active':''}}{{request()->segment(2) == 'edit_clinic_hospital'?'active':''}}{{request()->is('admin/clinic_doctor/*') ?'active':''}}{{request()->is('admin/clinic_doctor_two/*') ?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseClinic" aria-expanded="true" aria-controls="collapseClinic">
            <i class="fas fa-clinic-medical"></i>
            <span>{{ trans('admin.clinics') }}</span>
        </a>
        <div id="collapseClinic" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/clinic_hospital')?'active':''}}{{request()->segment(2) == 'edit_clinic_hospital'?'active':''}}{{request()->is('admin/clinic_doctor/*') ?'active':''}}" href="{{url('admin/clinic_hospital')}}">{{ trans('admin.all clinic') }}</a>
                <a class="collapse-item {{request()->is('admin/add_clinic_hospital')?'active':''}}" href="{{url('admin/add_clinic_hospital')}}">{{ trans('admin.add clinic') }}</a>
            </div>
        </div>
    </li>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/clinic_doctor', 'admin/add_doctor')?'active':''}}{{request()->segment(2) == 'edit_doctor_clinic'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDoctor" aria-expanded="true" aria-controls="collapseDoctor">
            <i class="fas fa-user-md"></i>
            <span>{{ trans('admin.doctors') }}</span>
        </a>
        <div id="collapseDoctor" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/clinic_doctor')?'active':''}}" href="{{url('admin/clinic_doctor')}}">{{ trans('admin.doctors') }}</a>
                <a class="collapse-item {{request()->is('admin/add_doctor')?'active':''}}" href="{{url('admin/add_doctor')}}">{{ trans('admin.add doctor') }}</a>
            </div>
        </div>
    </li>
    <li class="nav-item {{request()->is('admin/reserve_hospital_admin')?'active':''}}{{request()->segment(2) == 'show_reserve_hospital'?'active':''}}">
        <a class="nav-link" href="{{url('admin/reserve_hospital_admin')}}"><i class="fas fa-fw fa-file-invoice"></i><span>{{ trans('admin.reservations') }}</span><span id="reserveCount" class=""></span></a>
    </li>
    <li class="nav-item {{request()->is('admin/edit_hospital_admin')?'active':''}}">
        <a class="nav-link" href="{{url('admin/edit_hospital_admin')}}"><i class="fas fa-fw fa-hospital"></i><span>{{ trans('admin.edit hospital') }}</span></a>
    </li>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->segment(2) == 'edit_insurance'?'active':''}}{{request()->is('admin/insurances')?'active':''}}{{request()->is('admin/add_insurance')?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInsurance" aria-expanded="true" aria-controls="collapseInsurance">
            <i class="fas fa-fw fa-house-damage"></i>
            <span>{{ trans('admin.insurances') }}</span>
        </a>
        <div id="collapseInsurance" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/insurances')?'active':''}}" href="{{url('admin/insurances')}}">{{ trans('admin.all insurance') }}</a>
                <a class="collapse-item {{request()->is('admin/add_insurance')?'active':''}}" href="{{url('admin/add_insurance')}}">{{ trans('admin.add insurance') }}</a>
            </div>
        </div>
    </li>
    @endif
    
    @if(auth()->guard('admin')->user()->type == 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/clinics', 'admin/clinics/*', 'admin/add_clinic', 'admin/all_doctor', 'admin/add_doctor_clinic')?'active':''}}{{request()->segment(2) == 'edit_clinic'?'active':''}}{{request()->segment(2) == 'edit_doctor_clinic'?'active':''}}{{request()->segment(2) == 'reserve_clinic'?'active':''}}{{request()->segment(2) == 'show_reserve_clinic'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseClinic" aria-expanded="true" aria-controls="collapseClinic">
            <i class="fas fa-clinic-medical"></i>
            <span>{{ trans('admin.clinics') }}</span>
        </a>
        <div id="collapseClinic" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/clinics')?'active':''}}" href="{{url('admin/clinics')}}">{{ trans('admin.all clinic') }}</a>
                <a class="collapse-item {{request()->is('admin/add_clinic')?'active':''}}" href="{{url('admin/add_clinic')}}">{{ trans('admin.add clinic') }}</a>
            </div>
        </div>
    </li>
    @elseif(auth()->guard('admin')->user()->type == 2)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/all_doctor')?'active':''}}{{request()->segment(2) == 'edit_doctor_clinic'?'active':''}}">
        <a class="nav-link" href="{{url('admin/all_doctor')}}"><i class="fas fa-user-md"></i><span>{{ trans('admin.doctors') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/add_doctor_clinic')?'active':''}}">
        <a class="nav-link" href="{{url('admin/add_doctor_clinic')}}"><i class="fas fa-user-md"></i><span>{{ trans('admin.add doctor') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/reserve_clinic_admin')?'active':''}}{{request()->segment(2) == 'show_reserve_clinic'?'active':''}}">
        <a class="nav-link" href="{{url('admin/reserve_clinic_admin')}}"><i class="fas fa-fw fa-file-invoice"></i><span>{{ trans('admin.reservations') }}</span><span id="reserveCount" class=""></span></a>
    </li>
    <li class="nav-item {{request()->is('admin/edit_clinic_admin')?'active':''}}">
        <a class="nav-link" href="{{url('admin/edit_clinic_admin')}}"><i class="fas fa-clinic-medical"></i><span>{{ trans('admin.edit clinic') }}</span></a>
    </li>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->segment(2) == 'edit_insurance'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInsurance" aria-expanded="true" aria-controls="collapseInsurance">
            <i class="fas fa-fw fa-house-damage"></i>
            <span>{{ trans('admin.insurances') }}</span>
        </a>
        <div id="collapseInsurance" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/insurances')?'active':''}}" href="{{url('admin/insurances')}}">{{ trans('admin.all insurance') }}</a>
                <a class="collapse-item {{request()->is('admin/add_insurance')?'active':''}}" href="{{url('admin/add_insurance')}}">{{ trans('admin.add insurance') }}</a>
            </div>
        </div>
    </li>
    @endif

    @if(auth()->guard('admin')->user()->type == 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/restaurants', 'admin/add_restaurant')?'active':''}}{{request()->segment(2) == 'edit_restaurant'?'active':''}}{{request()->segment(2) == 'reserve_restaurant'?'active':''}}{{request()->segment(2) == 'show_reserve_restaurant'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRestaurant" aria-expanded="true" aria-controls="collapseRestaurant">
            <i class="fas fa-utensils"></i>
            <span>{{ trans('admin.restaurants') }}</span>
        </a>
        <div id="collapseRestaurant" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/restaurants')?'active':''}}" href="{{url('admin/restaurants')}}">{{ trans('admin.all restaurant') }}</a>
                <a class="collapse-item {{request()->is('admin/add_restaurant')?'active':''}}" href="{{url('admin/add_restaurant')}}">{{ trans('admin.add restaurant') }}</a>
            </div>
        </div>
    </li>
    @elseif(auth()->guard('admin')->user()->type == 3)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/reserve_restaurant_admin')?'active':''}}{{request()->segment(2) == 'show_reserve_restaurant'?'active':''}}">
        <a class="nav-link" href="{{url('admin/reserve_restaurant_admin')}}"><i class="fas fa-file-invoice"></i></i><span>{{ trans('admin.reservations') }}</span><span id="reserveCount" class=""></span></a>
    </li>
    <li class="nav-item {{request()->is('admin/edit_restaurant_admin')?'active':''}}">
        <a class="nav-link" href="{{url('admin/edit_restaurant_admin')}}"><i class="fas fa-utensils"></i></i><span>{{ trans('admin.edit restaurant') }}</span></a>
    </li>
    @endif
    
    @if(auth()->guard('admin')->user()->type == 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/caterings', 'admin/add_catering', 'admin/prices', 'admin/add_price')?'active':''}}{{request()->segment(2) == 'edit_catering'?'active':''}}{{request()->segment(2) == 'edit_price'?'active':''}}{{request()->segment(2) == 'reserve_catering'?'active':''}}{{request()->segment(2) == 'prices'?'active':''}}{{request()->segment(2) == 'show_reserve_catering'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCatering" aria-expanded="true" aria-controls="collapseCatering">
            <i class="fas fa-fw fa-tablets"></i>
            <span>{{ trans('admin.caterings') }}</span>
        </a>
        <div id="collapseCatering" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/caterings')?'active':''}}" href="{{url('admin/caterings')}}">{{ trans('admin.all catering') }}</a>
                <a class="collapse-item {{request()->is('admin/add_catering')?'active':''}}" href="{{url('admin/add_catering')}}">{{ trans('admin.add catering') }}</a>
            </div>
        </div>
    </li>
    @elseif(auth()->guard('admin')->user()->type == 4)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/prices')?'active':''}}{{request()->segment(2) == 'edit_price'?'active':''}}">
        <a class="nav-link" href="{{url('admin/prices')}}"><i class="fas fa-fw fa-hospital"></i><span>{{ trans('admin.price plan') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/add_price')?'active':''}}">
        <a class="nav-link" href="{{url('admin/add_price')}}"><i class="fas fa-fw fa-hospital"></i><span>{{ trans('admin.add price plan') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/reserve_catering_admin')?'active':''}}{{request()->segment(2) == 'show_reserve_catering'?'active':''}}">
        <a class="nav-link" href="{{url('admin/reserve_catering_admin')}}"><i class="fas fa-fw fa-file-invoice"></i><span>{{ trans('admin.reservations') }}</span><span id="reserveCount" class=""></span></a>
    </li>
    <li class="nav-item {{request()->is('admin/edit_catering_admin')?'active':''}}">
        <a class="nav-link" href="{{url('admin/edit_catering_admin')}}"><i class="fas fa-fw fa-hospital"></i><span>{{ trans('admin.edit catering') }}</span></a>
    </li>
    @endif

    @if(auth()->guard('admin')->user()->type == 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/advertisements', 'admin/add_advertisement')?'active':''}}{{request()->segment(2) == 'edit_advertisement'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAd" aria-expanded="true" aria-controls="collapseAd">
            <i class="fas fa-audio-description"></i>
            <span>{{ trans('admin.advertisements') }}</span>
        </a>
        <div id="collapseAd" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/advertisements')?'active':''}}" href="{{url('admin/advertisements')}}">{{ trans('admin.all advertisement') }}</a>
                <a class="collapse-item {{request()->is('admin/add_advertisement')?'active':''}}" href="{{url('admin/add_advertisement')}}">{{ trans('admin.add advertisement') }}</a>
            </div>
        </div>
    </li>
    
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/notifications', 'admin/add_notification')?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseNotification" aria-expanded="true" aria-controls="collapseNotification">
            <i class="fas fa-fw fa-bell"></i>
            <span>{{ trans('admin.notifications') }}</span>
        </a>
        <div id="collapseNotification" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/notifications')?'active':''}}" href="{{url('admin/notifications')}}">{{ trans('admin.all notification') }}</a>
                <a class="collapse-item {{request()->is('admin/add_notification')?'active':''}}" href="{{url('admin/add_notification')}}">{{ trans('admin.add notification') }}</a>
            </div>
        </div>
    </li>
    
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/countries', 'admin/add_country', 'admin/cities', 'admin/add_city')?'active':''}}{{request()->segment(2) == 'edit_country'?'active':''}}{{request()->segment(2) == 'edit_city'?'active':''}}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLocation" aria-expanded="true" aria-controls="collapseLocation">
            <i class="fas fa-fw fa-map-marker-alt"></i>
            <span>{{ trans('admin.location') }}</span>
        </a>
        <div id="collapseLocation" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">{{trans('admin.CUSTOM COMPONENTS:')}}</h6>
                <a class="collapse-item {{request()->is('admin/countries')?'active':''}}" href="{{url('admin/countries')}}">{{ trans('admin.countries') }}</a>
                <a class="collapse-item {{request()->is('admin/cities')?'active':''}}" href="{{url('admin/cities')}}">{{ trans('admin.cities') }}</a>
            </div>
        </div>
    </li>
    
    <li class="nav-item {{request()->is('admin/pages')?'active':''}}{{request()->segment(2) == 'edit_page'?'active':''}}">
        <a class="nav-link" href="{{url('admin/pages')}}"><i class="fas fa-fw fa-file"></i><span>{{ trans('admin.pages') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/coupons')?'active':''}}{{request()->segment(2) == 'edit_coupon'?'active':''}}">
        <a class="nav-link" href="{{url('admin/coupons')}}"><i class="fas fa-fw fa-tags"></i><span>{{ trans('admin.coupons') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/interests')?'active':''}}{{request()->segment(2) == 'edit_interest'?'active':''}}">
        <a class="nav-link" href="{{url('admin/interests')}}"><i class="fas fa-fw fa-heart"></i><span>{{ trans('admin.interests') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/contacts')?'active':''}}">
        <a class="nav-link" href="{{url('admin/contacts')}}"><i class="fas fa-fw fa-comment"></i><span>{{ trans('admin.contact') }}</span><span id="notifyCount" class=""></span></a>
    </li>
    
    @endif
    @if(auth()->guard('admin')->user()->type != 5)
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item {{request()->is('admin/contact')?'active':''}}">
        <a class="nav-link" href="{{url('admin/contact')}}"><i class="fas fa-fw fa-comment"></i><span>{{ trans('admin.contact') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/rates')?'active':''}}">
        <a class="nav-link" href="{{url('admin/rates')}}"><i class="fas fa-fw fa-star"></i><span>{{ trans('admin.rate') }}</span></a>
    </li>
    <li class="nav-item {{request()->is('admin/images')?'active':''}}">
        <a class="nav-link" href="{{url('admin/images')}}"><i class="fas fa-fw fa-images"></i><span>{{ trans('admin.images') }}</span></a>
    </li>
    @endif

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->
