@extends('common.index')
@section('page_title')
    {{trans('admin.users')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.users') }}</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all user') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.phone') }}</th>
                        <th>{{ trans('admin.email') }}</th>
                        <th>{{ trans('admin.image') }}</th>
                        <th>{{ trans('admin.gender') }}</th>
                        <!--<th>{{ trans('admin.activate') }}</th>-->
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($users as $user)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$user->name}}</td>
                        <td>{{$user->phone}}</td>
                        <td>{{$user->email}}</td>
                        <td><img src="{{asset($user->image)}}" class="img-thumbnail" style="height: 60px; width: 80px"></td>
                        <td>{{$user->gender}}</td>
                        <!--<td>-->
                        <!--    <input data-id="{{$user->id}}" data-type="user" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="{{trans('admin.active')}}" data-off="{{trans('admin.inactive')}}" {{ $user->active ? 'checked' : '' }}>-->
                        <!--</td>-->
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('edit_user', $user->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_user')}}/" data-id="{{ $user->id }}">{{trans('admin.delete')}}</button>
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
