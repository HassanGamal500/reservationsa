@extends('common.index')
@section('page_title')
    {{trans('admin.price plan')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    @if(auth()->guard('admin')->user()->type == 5)
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.price plan')}} - {{$catering_name->catering_name}}</h1>
    @else
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.price plan')}}</h1>
    @endif

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{trans('admin.all price plan')}}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{trans('admin.name')}}</th>
                        <th>{{trans('admin.price')}}</th>
                        <!--<th>{{ trans('admin.activate') }}</th>-->
                        @if(auth()->guard('admin')->user()->type != 5)<th>{{trans('admin.action')}}</th>@endif
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($prices as $price)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$price->name}}</td>
                        <td>{{$price->price}}</td>
                        <!--<td>-->
                        <!--    <input data-id="{{$price->id}}" data-type="price" class="toggle-class" type="checkbox" data-onstyle="success" data-offstyle="danger" data-toggle="toggle" data-on="{{trans('admin.active')}}" data-off="{{trans('admin.inactive')}}" {{ $price->active ? 'checked' : '' }}>-->
                        <!--</td>-->
                        @if(auth()->guard('admin')->user()->type != 5)
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{url(route('edit_price', $price->id))}}">{{trans('admin.edit')}}</a>
                                    <button class="dropdown-item alerts" data-url="{{asset('admin/delete_price')}}/" data-id="{{ $price->id }}">{{trans('admin.delete')}}</button>
                                </div>
                            </div>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
@endsection
