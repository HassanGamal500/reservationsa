@extends('common.index')
@section('page_title')
    {{trans('admin.hospitals')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.hospitals') }}</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all hospital') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.phone') }}</th>
                        <th>{{ trans('admin.image') }}</th>
{{--                        <th>Latitude</th>--}}
{{--                        <th>Longitude</th>--}}
                        <th>{{ trans('admin.numClinic') }}</th>
                        <th>{{ trans('admin.numDoctor') }}</th>
                        <th>{{ trans('admin.reservations') }}</th>
                        <!--<th>{{ trans('admin.activate') }}</th>-->
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($hospitals as $hospital)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$hospital->name}}</td>
                        <td>{{$hospital->phone}}</td>
                        <td><img src="{{asset($hospital->image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
{{--                        <td>{{$hospital->latitude}}</td>--}}
{{--                        <td>{{$hospital->longitude}}</td>--}}
                        <td>{{$hospital->numClinic}}</td>
                        <td>{{$hospital->numDoctor}}</td>
                        <td>{{$hospital->reservations}}</td>
                        <!--<td>-->
                        <!--    <input data-id="{{$hospital->id}}" data-type="hospital" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="{{trans('admin.active')}}" data-off="{{trans('admin.inactive')}}" {{ $hospital->active ? 'checked' : '' }}>-->
                        <!--</td>-->
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('hospital_reserve', $hospital->id))}}">{{trans('admin.reservations')}}</a>
                                    <a class="dropdown-item" href="{{url(route('show_clinic', $hospital->id))}}">{{trans('admin.clinics')}}</a>
                                    <a class="dropdown-item" href="{{url(route('show_doctor', $hospital->id))}}">{{trans('admin.doctors')}}</a>
                                    <a class="dropdown-item" href="{{url(route('edit_hospital', $hospital->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_hospital')}}/" data-id="{{ $hospital->id }}">{{trans('admin.delete')}}</button>
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
