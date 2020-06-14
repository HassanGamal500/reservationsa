@extends('common.index')
@section('page_title')
    {{trans('admin.rates')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.rates') }}</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all rate') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.content') }}</th>
                        <th>{{ trans('admin.star') }}</th>
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($rates as $rate)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$rate->name}}</td>
                        <td>{{$rate->content}}</td>
                        <td>{{number_format($rate->star, 1)}}</td>
                        <td>
                            <button class="btn btn-danger alerts" data-url="{{asset('admin/rate_delete')}}/" data-id="{{ $rate->id }}">{{trans('admin.delete')}}</button>
                        </td>
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
