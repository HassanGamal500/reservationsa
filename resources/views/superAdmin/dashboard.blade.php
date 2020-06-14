@extends('common.index')
@section('page_title')
    {{trans('admin.dashboard')}}
@endsection
@section('content')
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">{{trans('admin.dashboard')}}</h1>
    </div>
    <!-- Content Row -->
    <div class="row">
        <!-- Earnings (Monthly) Card Example -->
        @if(auth()->guard('admin')->user()->type == 5)
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/users')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.users')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$users}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/hospitals')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.hospitals')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$hospitals}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-hospital fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/caterings')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.caterings')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$caterings}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-tablets fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/clinics')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.clinics')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$clinics}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clinic-medical fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/restaurants')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.restaurants')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$restaurants}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-utensils fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.reservations')}}</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{$reservations}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.departments')}}</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">4</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-bezier-curve fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/advertisements')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.advertisements')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$ad}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-audio-description fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/coupons')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.coupons')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$coupons}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-tags fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/interests')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.interests')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$interests}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-heart fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        
        @elseif(auth()->guard('admin')->user()->type == 1)
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/clinic_hospital')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.clinics')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$clinics}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clinic-medical fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/clinic_doctor')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.doctors')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$doctors}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user-md fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/reserve_hospital_admin')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.reservations')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$reservations}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/rates')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.rates')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$rates}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-star fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        @elseif(auth()->guard('admin')->user()->type == 2)
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/all_doctor')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.doctors')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$doctors}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user-md fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/reserve_clinic_admin')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.reservations')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$reservations}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/rates')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.rates')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$rates}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-star fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        @elseif(auth()->guard('admin')->user()->type == 3)
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/reserve_restaurant_admin')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.reservations')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$reservations}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/rates')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.rates')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$rates}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-star fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        @elseif(auth()->guard('admin')->user()->type == 4)
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/prices')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.price plan')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$prices}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-money-bill-wave fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/reserve_catering_admin')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.reservations')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$reservations}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-file-invoice fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <a href="{{asset('/admin/rates')}}" style="text-decoration: none;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">{{trans('admin.rates')}}</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$rates}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-star fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        @endif
    </div>
    @if(auth()->guard('admin')->user()->type == 5)
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">{{trans('admin.top 5 reservations')}}</h1>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.hospitals') }}</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered text-center" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>{{ trans('admin.name') }}</th>
                            <th>{{ trans('admin.image') }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($top_hospital as $hospital)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td><a href="{{url(route('edit_hospital', $hospital->hospital_id))}}" style="text-decoration : none; color:#858796;">{{$hospital->hospital_name}}</a></td>
                            <td><img src="{{asset($hospital->hospital_image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.clinics') }}</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered text-center" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>{{ trans('admin.name') }}</th>
                            <th>{{ trans('admin.image') }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($top_clinic as $clinic)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td><a href="{{url(route('edit_clinic', $clinic->clinic_id))}}" style="text-decoration : none; color:#858796;">{{$clinic->clinic_name}}</a></td>
                            <td><img src="{{asset($clinic->clinic_image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.restaurants') }}</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered text-center" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>{{ trans('admin.name') }}</th>
                            <th>{{ trans('admin.image') }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($top_restaurant as $restaurant)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td><a href="{{url(route('edit_restaurant', $restaurant->restaurant_id))}}" style="text-decoration : none; color:#858796;">{{$restaurant->restaurant_name}}</a></td>
                            <td><img src="{{asset($restaurant->restaurant_image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
        <div class="col-lg-6">
                    <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.caterings') }}</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered text-center" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>{{ trans('admin.name') }}</th>
                            <th>{{ trans('admin.image') }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($top_catering as $catering)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td><a href="{{url(route('edit_catering', $catering->catering_id))}}" style="text-decoration : none; color:#858796;">{{$catering->catering_name}}</a></td>
                            <td><img src="{{asset($catering->catering_image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
        
    </div>

    @endif
</div>
@endsection
