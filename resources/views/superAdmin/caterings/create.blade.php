@extends('common.index')
@section('page_title')
    {{trans('admin.add catering')}}
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
        <form method="post" action="{{route('store_catering')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="catering_name[1]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name english')}}" value="{{ old('catering_name.1') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="catering_name[2]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name arabic')}}" value="{{ old('catering_name.2') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.phone')}}</label>
                <input type="tel" pattern="^[0-9]*$" name="catering_phone" class="form-control" maxlength="13" placeholder="{{trans('admin.enter phone')}}" value="{{ old('catering_phone') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="catering_image" class="form-control-file" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description part')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="catering_description_part[1]" class="form-control" maxlength="140" placeholder="{{trans('admin.enter description part')}}" value="{{ old('catering_description_part.1') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description part')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="catering_description_part[2]" class="form-control" maxlength="140" placeholder="{{trans('admin.enter description part')}}" value="{{ old('catering_description_part.2') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description full')}} ({{trans('admin.english')}})</label>
                <textarea type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="catering_description_full[1]" class="form-control" placeholder="{{trans('admin.enter description full')}}" required>{{ old('catering_description_full.1') }}</textarea>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description full')}} ({{trans('admin.arabic')}})</label>
                <textarea type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="catering_description_full[2]" class="form-control" placeholder="{{trans('admin.enter description full')}}" required>{{ old('catering_description_full.2') }}</textarea>
            </div>
            <div class="form-group">
                <label>{{trans('admin.select country')}}</label>
                <select class="form-control country_id" name="country_id">
                    <option disabled selected>{{trans('admin.select country')}}</option>
                    @foreach($countries as $country)
                    <option value="{{$country->id}}">{{$country->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.select city')}}</label>
                <select class="form-control city_id" name="city_id" id="">
                    <option disabled selected>{{trans('admin.select city')}}</option>
                </select>
            </div>
            <!--<div class="form-group">-->
            <!--    <label>{{trans('admin.select city')}}</label>-->
            <!--    <select class="form-control" name="city_id">-->
            <!--        @foreach($cities as $city)-->
            <!--        <option value="{{$city->id}}">{{$city->name}}</option>-->
            <!--        @endforeach-->
            <!--    </select>-->
            <!--</div>-->
            <div class="form-group">
                <label>{{trans('admin.latitude')}}</label>
                <input type="text" pattern="^[0-9.,\u0660-\u0669\u06f0-\u06f9]+$" name="catering_latitude" class="form-control" placeholder="{{trans('admin.enter latitude')}}" value="{{ old('catering_latitude') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.longitude')}}</label>
                <input type="text" pattern="^[0-9.,\u0660-\u0669\u06f0-\u06f9]+$" name="catering_longitude" class="form-control" placeholder="{{trans('admin.enter longitude')}}" value="{{ old('catering_longitude') }}" required>
            </div>
            <hr>
            <div class="form-group">
                <label>{{trans('admin.email')}}</label>
                <input type="email" name="email" class="form-control" placeholder="{{trans('admin.enter email')}}" value="{{ old('email') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.password')}}</label>
                <input type="password" name="password" class="form-control" placeholder="{{trans('admin.enter password')}}" required>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
