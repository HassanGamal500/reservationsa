@extends('common.index')
@section('page_title')
    {{trans('admin.notifications')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.notifications') }}</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all notification') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.content') }}</th>
                        <th>{{ trans('admin.image') }}</th>
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($notifications as $not)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$not->name}}</td>
                        <td>{{$not->content}}</td>
                        <td><img src="{{asset($not->image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
                        <td>
                            <button class="btn btn-danger alerts" data-url="{{asset('admin/delete_notification')}}/" data-id="{{ $not->id }}">{{trans('admin.delete')}}</button>
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