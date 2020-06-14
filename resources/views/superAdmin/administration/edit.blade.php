@extends('common.index')
@section('page_title')
    {{trans('admin.edit user')}}
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
        <form method="post" action="{{route('update_administration', $users->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}}</label>
                <input type="text" name="name" class="form-control" placeholder="Enter Name" value="{{$users->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.phone')}}</label>
                <input type="tel" pattern="^[0-9]*$" name="phone" class="form-control" placeholder="Enter Phone" value="{{$users->phone}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.email')}}</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email" value="{{$users->email}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.password')}}</label>
                <input type="password" name="password" class="form-control" placeholder="Enter New Password">
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="image" id="image" class="form-control-file">
                <br>
                <img src="{{asset($users->image)}}" class="img-thumbnail" height="70px" width="100px">
            </div>
            @if(auth()->guard('admin')->user()->type != 5)
            <div class="form-group">
                <label>{{trans('admin.select Type')}}</label>
                <select class="form-control" name="type_id">
                    @foreach($select as $selects)
                    <option value="{{$selects->id}}" {{$users->type_id == $selects->id ? 'selected':''}}>{{$selects->name}}</option>
                    @endforeach
                </select>
            </div>
            @else
            <input type="hidden" name="type_id" value="0">
            @endif
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
