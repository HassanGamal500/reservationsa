@extends('common.index')
@section('page_title')
    {{trans('admin.add country')}}
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
        <form method="post" action="{{route('store_country')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="country_name[1]" class="form-control" maxlength="100" placeholder="{{trans('admin.enter name english')}}" value="{{ old('country_name.1') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="country_name[2]" class="form-control" maxlength="100" placeholder="{{trans('admin.enter name arabic')}}" value="{{ old('country_name.2') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.activate')}}</label>
                <select class="form-control" name="is_active">
                    <option value="1">{{trans('admin.active')}}</option>
                    <option value="0">{{trans('admin.inactive')}}</option>
                </select>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
