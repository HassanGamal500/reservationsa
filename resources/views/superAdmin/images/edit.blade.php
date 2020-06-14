@extends('common.index')
@section('page_title')
    {{trans('admin.edit image')}}
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
        <form method="post" action="{{route('update_image', $image->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.image')}}</label>
                <input type="file" name="image" class="form-control-file" required>
                <br>
                <input type="hidden" name="old_image" value="{{$image->image}}">
                <img src="{{asset($image->image)}}" class="img-thumbnail" height="70px" width="100px">
            </div>
            <br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
