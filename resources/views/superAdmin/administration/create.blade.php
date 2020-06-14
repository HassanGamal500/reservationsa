@extends('common.index')
@section('page_title')
    {{trans('admin.add administration')}}
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
        <form method="post" action="{{route('store_administration')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}}</label>
                <input type="text" name="name" class="form-control" placeholder="Enter Name" value="{{ old('name') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.phone')}}</label>
                <input type="tel" pattern="^[0-9]*$" name="phone" class="form-control" placeholder="Enter Phone" value="{{ old('phone') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.email')}}</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email" value="{{ old('email') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.password')}}</label>
                <input type="password" name="password" class="form-control" placeholder="Enter New Password" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="image" id="image" class="form-control-file" required>
            </div>
            <input type="hidden" name="type" value="{{$type}}">
            <div class="form-group">
                <label>{{trans('admin.select Type')}}</label>
                <select class="form-control" name="type_id">
                    @foreach($select as $selects)
                    <option value="{{$selects->id}}">{{$selects->name}}</option>
                    @endforeach
                </select>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
