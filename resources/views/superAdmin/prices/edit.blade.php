@extends('common.index')
@section('page_title')
    {{trans('admin.add price plan')}}
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
        <form method="post" action="{{route('update_price', $prices[0]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="price_plan_description_name[1]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name english')}}" value="{{$prices[0]->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="price_plan_description_name[2]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name arabic')}}" value="{{$prices[1]->name}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.price')}}</label>
                <input type="text" name="price" class="form-control" placeholder="{{trans('admin.enter price')}}" value="{{$prices[0]->price}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.description part')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="price_plan_description_part[1]" class="form-control" placeholder="{{trans('admin.enter description part')}}" value="{{$prices[0]->description_part}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.description part')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="price_plan_description_part[2]" class="form-control" placeholder="{{trans('admin.enter description part')}}" value="{{$prices[1]->description_part}}">
            </div>
            <div class="form-group">
                <label>{{trans('admin.activate')}}</label>
                <select class="form-control" name="active">
                    <option value="1" {{$prices[0]->active == 1 ? 'selected':''}}>{{trans('admin.active')}}</option>
                    <option value="0" {{$prices[0]->active == 0 ? 'selected':''}}>{{trans('admin.inactive')}}</option>
                </select>
            </div>
            @if(auth()->guard('admin')->user()->type == 5)
            <div class="form-group">
                <label>{{trans('admin.select catering')}}</label>
                <select class="form-control" name="catering_id">
                    @foreach($caterings as $catering)
                        <option value="{{$catering->id}}" {{$prices[0]->catering_id == $catering->id ? 'selected':''}}>{{$catering->name}}</option>
                    @endforeach
                </select>
            </div>
            @elseif(auth()->guard('admin')->user()->type == 4)
            <input type="hidden" name="catering_id" value="{{auth()->guard('admin')->user()->type_id}}">
            @endif
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
