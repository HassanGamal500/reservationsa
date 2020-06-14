@extends('common.index')
@section('page_title')
    {{trans('admin.edit advertisement')}}
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
        <form method="post" action="{{route('update_advertisement', $advertisements[0]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()<>-\s]+$" name="advertisement_description_name[1]" class="form-control" placeholder="{{trans('admin.enter name english')}}" value="{{$advertisements[0]->name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="advertisement_description_name[2]" class="form-control" placeholder="{{trans('admin.enter name arabic')}}" value="{{$advertisements[1]->name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.upload photo')}}</label>
                <input type="file" name="advertisement_image" class="form-control-file">
                <br>
                <input type="hidden" name="old_image" value="{{$advertisements[0]->image}}">
                <img src="{{asset($advertisements[0]->image)}}" class="img-thumbnail" height="70px" width="100px">
            </div>
            <div class="form-group">
                <label>{{trans('admin.selectServices')}}</label>
                <select class="form-control type" name="type" id="">
                    <option disabled selected>{{trans('admin.select Type')}}</option>
                    <option value="1" {{$advertisements[0]->type == '1' ? 'selected': ''}}>{{trans('admin.hospital')}}</option>
                    <option value="2" {{$advertisements[0]->type == '2' ? 'selected': ''}}>{{trans('admin.clinic')}}</option>
                    <option value="3" {{$advertisements[0]->type == '3' ? 'selected': ''}}>{{trans('admin.restaurant')}}</option>
                    <option value="4" {{$advertisements[0]->type == '4' ? 'selected': ''}}>{{trans('admin.caterings')}}</option>
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.select Type')}}</label>
                <select class="form-control type_id" name="type_id" id="">
                    <option disabled selected>{{trans('admin.select Type')}}</option>
                    @foreach($select as $row)
                        <option value="{{$row->id}}" {{$advertisements[0]->type_id == $row->id ? 'selected': ''}}>{{$row->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.interests')}}</label>
                <select class="form-control" name="interest_id" id="">
                    <option disabled selected>{{trans('admin.select Type')}}</option>
                    @foreach($interests as $interest)
                    <option value="{{$interest->interest_id}}" {{$advertisements[0]->interest_id == $interest->interest_id ? 'selected' : ''}}>{{$interest->interest_name}}</option>
                    @endforeach
                </select>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
