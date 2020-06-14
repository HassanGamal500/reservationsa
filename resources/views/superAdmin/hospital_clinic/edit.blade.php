@extends('common.index')
@section('page_title')
    {{trans('admin.edit clinic')}}
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
        <form method="post" action="{{route('update_clinic_hospital', $clinics[0]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="clinic_name[1]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name english')}}" value="{{$clinics[0]->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="clinic_name[2]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name arabic')}}" value="{{$clinics[1]->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.activate')}}</label>
                <select class="form-control" name="active">
                    <option value="1" {{$clinics[0]->active == 1 ? 'selected':''}}>{{trans('admin.active')}}</option>
                    <option value="0" {{$clinics[0]->active == 0 ? 'selected':''}}>{{trans('admin.inactive')}}</option>
                </select>
            </div>
            @if(auth()->guard('admin')->user()->type == 5)
            <input type="hidden" name="hospital_id" value="{{$clinics[0]->hospital_id}}">
            @elseif(auth()->guard('admin')->user()->type == 1)
            <input type="hidden" name="hospital_id" value="{{auth()->guard('admin')->user()->type_id}}">
            @endif
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
