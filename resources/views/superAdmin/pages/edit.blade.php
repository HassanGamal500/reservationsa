@extends('common.index')
@section('page_title')
    {{trans('admin.edit page')}}
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
        <form method="post" action="{{route('update_page', $pages[0]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()<>-\s]+$" name="page_description_name[1]" class="form-control" placeholder="{{trans('admin.enter name english')}}" value="{{$pages[0]->name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669 0-9_.,/{}@#!~%()<>-]+$" name="page_description_name[2]" class="form-control" placeholder="{{trans('admin.enter name arabic')}}" value="{{$pages[1]->name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description content')}} ({{trans('admin.english')}})</label>
                <textarea type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()<>-\s]+$" id="articleContentEN" name="page_description_content[1]" class="form-control" placeholder="{{trans('admin.enter content')}}" required>{{$pages[0]->content}}</textarea>
            </div>
            <div class="form-group">
                <label>{{trans('admin.description content')}} ({{trans('admin.arabic')}})</label>
                <textarea type="text" pattern="^[\u0621-\u064A\u0660-\u0669 0-9_.,/{}@#!~%()<>-]+$" id="articleContentAR" name="page_description_content[2]" class="form-control" placeholder="{{trans('admin.enter content')}}" required>{{$pages[1]->content}}</textarea>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
