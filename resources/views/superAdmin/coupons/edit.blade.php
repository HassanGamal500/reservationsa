@extends('common.index')
@section('page_title')
    {{trans('admin.edit coupon')}}
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
        <form method="post" action="{{route('update_coupon', $coupons->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}}</label>
                <input type="text" name="coupon_name" class="form-control" placeholder="{{trans('admin.enter name')}}" value="{{$coupons->name}}" required>
            </div>
            <div class="form-group" style="position:relative">
                <label>{{trans('admin.discount')}}</label>
                <span class="perscentage">%</span>
                <input type="text" name="coupon_discount" class="form-control discount" placeholder="{{trans('admin.enter discount')}}" value="{{$coupons->discount}}" required>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
