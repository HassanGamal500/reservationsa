@extends('common.index')
@section('page_title')
    {{trans('admin.edit profile')}}
@endsection
@section('content')

    <!-- Begin Page Content -->
    <div class="container-fluid">
        @if(session()->has('error'))
            <div class="alert alert-danger" role="alert">
                {{session()->get('error')}}
            </div>
        @elseif(session()->has('message'))
            <div class="alert alert-success" role="alert">
                {{session()->get('message')}}
            </div>
        @endif
        <form method="post" action="{{route('update_profile', $users->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}}</label>
                <input type="text" name="name" class="form-control" placeholder="{{trans('admin.enter name')}}" value="{{$users->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.phone')}}</label>
                <input type="tel" pattern="^[0-9]*$" name="phone" class="form-control" placeholder="{{trans('admin.enter phone')}}" value="{{$users->phone}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.email')}}</label>
                <input type="email" name="email" class="form-control" placeholder="{{trans('admin.enter email')}}" value="{{$users->email}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.password')}}</label>
                <input type="password" name="password" class="form-control" placeholder="{{trans('admin.enter new password')}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="image" id="image" class="form-control-file">
                <br>
                <input type="hidden" name="old_image" value="{{$users->image}}">
                <img src="{{asset($users->image)}}" class="img-thumbnail" height="70px" width="100px">
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
