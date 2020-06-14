@extends('common.index')
@section('page_title')
    {{trans('admin.clinics')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    @if(auth()->guard('admin')->user()->type == 5)
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.clinics')}} - {{$hospital_name->hospital_name}}</h1>
    @else
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.clinics')}}</h1>
    @endif
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{trans('admin.all clinic')}}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <!--<th>Latitude</th>-->
                        <!--<th>Longitude</th>-->
                        <th>{{ trans('admin.numDoctor') }}</th>
                        <!--<th>{{ trans('admin.activate') }}</th>-->
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($hospitals as $hospital)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$hospital->name}}</td>
                        <!--<td>{{$hospital->latitude}}</td>-->
                        <!--<td>{{$hospital->longitude}}</td>-->
                        <td>{{$hospital->numDoctor}}</td>
                        <!--<td>-->
                        <!--    <input data-id="{{$hospital->id}}" data-type="hospital_clinic" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="{{trans('admin.active')}}" data-off="{{trans('admin.inactive')}}" {{ $hospital->active ? 'checked' : '' }}>-->
                        <!--</td>-->
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('show_doctor', $hospital->id))}}">{{trans('admin.doctors')}}</a>
                                    @if(auth()->guard('admin')->user()->type != 5)
                                    <a class="dropdown-item" href="{{url(route('edit_clinic_hospital', $hospital->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_clinic_hospital')}}/" data-id="{{ $hospital->id }}">{{trans('admin.delete')}}</button>
                                    @endif
                                </div>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
@endsection
