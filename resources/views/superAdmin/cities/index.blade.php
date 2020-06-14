@extends('common.index')
@section('page_title')
    {{trans('admin.cities')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.cities') }}</h1>
    <a href="{{url(route('create_city'))}}" class="btn btn-primary mb-2">{{trans('admin.add city')}}</a>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all cities') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($cities as $city)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$city->name}}</td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('edit_city', $city->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_city')}}/" data-id="{{ $city->id }}">{{trans('admin.delete')}}</button>
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