@extends('common.index')
@section('page_title')
    {{trans('admin.edit catering')}}
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
        <form method="post" action="{{route('update_catering', $caterings[0]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="catering_name[1]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter nam english')}}" value="{{$caterings[0]->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="catering_name[2]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name arabic')}}" value="{{$caterings[1]->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.phone')}}</label>
                <input type="tel" pattern="^[0-9]*$" name="catering_phone" class="form-control" maxlength="13" placeholder="{{trans('admin.enter phone')}}" value="{{$caterings[0]->phone}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="catering_image" class="form-control-file">
                <br>
                <input type="hidden" name="old_image" value="{{$caterings[0]->image}}">
                <img src="{{asset($caterings[0]->image)}}" class="img-thumbnail" height="70px" width="100px">
            </div>
            <div class="form-group">
                <label>{{trans('admin.description part')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="catering_description_part[1]" class="form-control" maxlength="140" placeholder="{{trans('admin.enter description part')}}" value="{{$caterings[0]->description_part}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.description part')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="catering_description_part[2]" class="form-control" maxlength="140" placeholder="{{trans('admin.enter description part')}}" value="{{$caterings[1]->description_part}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.description full')}} ({{trans('admin.english')}})</label>
                <textarea type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="catering_description_full[1]" class="form-control" placeholder="{{trans('admin.enter description full')}}">{{$caterings[0]->description_full}}</textarea>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description full')}} ({{trans('admin.arabic')}})</label>
                <textarea type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="catering_description_full[2]" class="form-control" placeholder="{{trans('admin.enter description full')}}">{{$caterings[1]->description_full}}</textarea>
            </div>
            <div class="form-group">
                <label>{{trans('admin.select country')}}</label>
                <select class="form-control country_id" name="country_id">
                    <option disabled>{{trans('admin.select country')}}</option>
                    @foreach($countries as $country)
                    <option value="{{$country->id}}" {{$caterings[0]->country_id == $country->id ? "selected" : ""}}>{{$country->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.select city')}}</label>
                <select class="form-control city_id" name="city_id" id="">
                    <option disabled>{{trans('admin.select city')}}</option>
                    @foreach($cities as $city)
                    <option value="{{$city->id}}" {{$caterings[0]->city_id == $city->id ? "selected" : ""}}>{{$city->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.latitude')}}</label>
                <input type="text" pattern="^[0-9.,\u0660-\u0669\u06f0-\u06f9]+$" name="catering_latitude" class="form-control" placeholder="{{trans('admin.enter latitude')}}" value="{{$caterings[0]->latitude}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.longitude')}}</label>
                <input type="text" pattern="^[0-9.,\u0660-\u0669\u06f0-\u06f9]+$" name="catering_longitude" class="form-control" placeholder="{{trans('admin.enter longitude')}}" value="{{$caterings[0]->longitude}}">
            </div>
            <hr>
            <div class="form-group">
                <label>{{trans('admin.email')}}</label>
                <input type="email" name="email" class="form-control" placeholder="{{trans('admin.enter email')}}" value="{{$user->email}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.password')}}</label>
                <input type="password" name="password" class="form-control" placeholder="{{trans('admin.enter new password')}}">
            </div>
            @if(auth()->guard('admin')->user()->type == 5)
            <div class="form-group">
                <label>{{trans('admin.activate')}}</label>
                <select class="form-control" name="active">
                    <option value="1" {{$caterings[0]->active == 1 ? 'selected':''}}>{{trans('admin.active')}}</option>
                    <option value="0" {{$caterings[0]->active == 0 ? 'selected':''}}>{{trans('admin.inactive')}}</option>
                </select>
            </div>
            @endif
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
