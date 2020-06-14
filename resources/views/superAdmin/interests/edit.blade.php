@extends('common.index')
@section('page_title')
    {{trans('admin.edit interest')}}
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
        <form method="post" action="{{route('update_interest', $interests[1]->interest_id)}}">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="interest_name[1]" class="form-control" placeholder="{{trans('admin.enter name english')}}" value="{{$interests[0]->interest_name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="interest_name[2]" class="form-control" placeholder="{{trans('admin.enter name arabic')}}" value="{{$interests[1]->interest_name}}" required>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
