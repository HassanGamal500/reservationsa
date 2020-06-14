@extends('common.index')
@section('page_title')
    {{trans('admin.edit insurance')}}
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
        <form method="post" action="{{route('update_insurance', $insurances[1]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="insurance_name[1]" class="form-control" placeholder="{{trans('admin.enter name english')}}" value="{{$insurances[0]->insurance_name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="insurance_name[2]" class="form-control" placeholder="{{trans('admin.enter name arabic')}}" value="{{$insurances[1]->insurance_name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description content')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="insurance_description_content[1]" class="form-control" placeholder="{{trans('admin.enter description content')}}" value="{{$insurances[0]->insurance_description_content}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.description content')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="insurance_description_content[2]" class="form-control" placeholder="{{trans('admin.enter description content')}}" value="{{$insurances[1]->insurance_description_content}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="hidden" name="old_image" value="{{$insurances[0]->image}}">
                <input type="file" name="image" class="form-control-file">
                <br>
                <img src="{{asset($insurances[0]->image)}}" class="img-thumbnail" height="70px" width="100px">
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
