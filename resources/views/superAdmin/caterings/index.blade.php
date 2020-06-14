@extends('common.index')
@section('page_title')
    {{trans('admin.caterings')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.caterings') }}</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all catering') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.image') }}</th>
                        <th>{{ trans('admin.numPrice') }}</th>
                        <th>{{ trans('admin.reservations') }}</th>
                        <!--<th>{{ trans('admin.activate') }}</th>-->
{{--                        <th>Latitude</th>--}}
{{--                        <th>Longitude</th>--}}
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($caterings as $catering)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$catering->name}}</td>
                        <td><img src="{{asset($catering->image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
{{--                        <td>{{$catering->latitude}}</td>--}}
{{--                        <td>{{$catering->longitude}}</td>--}}
                        <td>{{$catering->numPrice}}</td>
                        <td>{{$catering->reservations}}</td>
                        <!--<td>-->
                        <!--    <input data-id="{{$catering->id}}" data-type="catering" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="{{trans('admin.active')}}" data-off="{{trans('admin.inactive')}}" {{ $catering->active ? 'checked' : '' }}>-->
                        <!--</td>-->
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('catering_reserve', $catering->id))}}">{{trans('admin.reservations')}}</a>
                                    <a class="dropdown-item" href="{{url(route('show_price', $catering->id))}}">{{trans('admin.price plan')}}</a>
                                    <a class="dropdown-item" href="{{url(route('edit_catering', $catering->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_catering')}}/" data-id="{{ $catering->id }}">{{trans('admin.delete')}}</button>
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
