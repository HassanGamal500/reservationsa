@extends('common.index')
@section('page_title')
    {{trans('admin.add notification')}}
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
        <form method="post" action="{{route('store_notification')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.send to')}}</label>
                <select class="form-control" name="send" id="selectOption">
                    <option value="1">{{trans('admin.all')}}</option>
                    <option value="2">{{trans('admin.someone by email')}}</option>
                </select>
            </div>
            <div class="form-group" id="show_hide" style="display: none;">
                <label>{{trans('admin.email')}}</label>
                <select class="form-control searchOption2" name="email" placeholder="Search..." style="width: 100%">
                    <option value="">Select an Email...</option>
                    @foreach($users as $user)
                        <option value="{{ $user->id }}">{{ $user->email }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.title')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="notification_name[1]" class="form-control" maxlength="80" placeholder="{{trans('admin.enter title')}}" value="{{ old('notification_name.1') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.title')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="notification_name[2]" class="form-control" maxlength="80" placeholder="{{trans('admin.enter title')}}" value="{{ old('notification_name.2') }}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.content')}} ({{trans('admin.english')}})</label>
                <textarea type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="notification_content[1]" class="form-control" maxlength="100" placeholder="{{trans('admin.enter content')}}" required>{{ old('notification_content.1') }}</textarea>
            </div>
            <div class="form-group">
                <label>{{trans('admin.content')}} ({{trans('admin.arabic')}})</label>
                <textarea type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="notification_content[2]" class="form-control" maxlength="100" placeholder="{{trans('admin.enter content')}}" required>{{ old('notification_content.2') }}</textarea>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
