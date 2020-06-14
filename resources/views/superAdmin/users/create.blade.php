@extends('common.index')
@section('page_title')
    {{trans('admin.add user')}}
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
        <form method="post" action="{{route('store_user')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}}</label>
                <input type="text" name="name" class="form-control" placeholder="{{trans('admin.enter name')}}" value="{{ old('name') }}" required>
            </div>
            <div class="input-group mb-3">
                <!--<label>{{trans('admin.phone')}}</label>-->
                <div class="input-group-prepend">
                    <select class="form-control" name="phone_code">
                        <option selected disabled>{{trans('admin.select country code')}}</option>
                        @foreach($codes as $code)
                            <option value="{{$code->phonecode}}">{{$code->country_name}}</option>
                        @endforeach
                    </select>
                </div>
                <input type="tel" pattern="^[1-9][0-9]+$" name="phone" class="form-control" placeholder="{{trans('admin.enter phone')}}" value="{{ old('phone') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.email')}}</label>
                <input type="email" name="email" class="form-control" placeholder="{{trans('admin.enter email')}}" value="{{ old('email') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.password')}}</label>
                <input type="password" name="password" class="form-control" placeholder="{{trans('admin.enter new password')}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="image" id="image" class="form-control-file" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.gender')}}</label>
                <select class="form-control" name="gender">
                    <option value="male">{{trans('admin.male')}}</option>
                    <option value="female">{{trans('admin.female')}}</option>
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.interests')}}</label>
            </div>
            @foreach($interests as $interest)
                <div class="form-check form-check-inline">
                    <input class="form-check-input" name="interests[]" type="checkbox" id="inlineCheckbox{{$interest->id}}" value="{{$interest->id}}">
                    <label class="form-check-label" for="inlineCheckbox{{$interest->id}}">{{$interest->name}}</label>
                </div>
            @endforeach
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
