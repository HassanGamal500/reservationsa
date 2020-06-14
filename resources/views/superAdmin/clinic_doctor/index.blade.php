@extends('common.index')
@section('page_title')
    {{trans('admin.doctors')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    @if(isset($hospital_name))
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.doctors')}} - {{$hospital_name->hospital_name}}</h1>
    @elseif(isset($clinic_name))
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.doctors')}} - {{$clinic_name->clinic_name}}</h1>
    @else
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.doctors')}}</h1>
    @endif
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{trans('admin.all doctor')}}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{trans('admin.name')}}</th>
                        <th>{{trans('admin.specialization')}}</th>
                        <th>{{trans('admin.start')}}</th>
                        <th>{{trans('admin.end')}}</th>
                        <th>{{trans('admin.price')}}</th>
                        <!--<th>{{ trans('admin.activate') }}</th>-->
                        @if(auth()->guard('admin')->user()->type != 5)<th>{{trans('admin.action')}}</th>@endif
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($doctors as $doctor)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$doctor->name}}</td>
                        <td>{{$doctor->specialization}}</td>
                        <td>@if($doctor->start < 10) 0{{$doctor->start}}:00 @else {{$doctor->start}}:00 @endif</td>
                        <td>@if($doctor->end < 10) 0{{$doctor->end}}:00 @else {{$doctor->end}}:00 @endif</td>
                        <td>{{setting()->currency_name}} {{$doctor->price}}</td>
                        <!--<td>-->
                        <!--    <input data-id="{{$doctor->id}}" data-type="doctor" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="{{trans('admin.active')}}" data-off="{{trans('admin.inactive')}}" {{ $doctor->active ? 'checked' : '' }}>-->
                        <!--</td>-->
                        @if(auth()->guard('admin')->user()->type != 5)
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('edit_doctor', $doctor->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_doctor')}}/" data-id="{{ $doctor->id }}">{{trans('admin.delete')}}</button>
                                </div>
                            </div>
                        </td>
                        @endif
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
