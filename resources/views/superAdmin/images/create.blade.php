@extends('common.index')
@section('page_title')
    {{trans('admin.add images')}}
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
        <form method="post" action="{{route('store_image')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group row_more">
                <label>{{trans('admin.image')}}</label>
                <input type="file" name="image[0]" class="form-control-file" placeholder="Enter Image" required multiple>
            </div>
            <!--<button type="button" name="more" id="more" class="btn btn-success">Add More</button>-->
            <!--<br><br>-->
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
