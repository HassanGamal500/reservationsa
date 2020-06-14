@extends('common.index')
@section('page_title')
    {{trans('admin.reservation hospital')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    @if(auth()->guard('admin')->user()->type == 5)
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.reservations')}} - {{$hospital->hospital_name}}</h1>
    @else
    <h1 class="h3 mb-2 text-gray-800">{{trans('admin.reservations')}}</h1>
    @endif

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{trans('admin.all reservation')}}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{trans('admin.username')}}</th>
                        <th>{{trans('admin.day')}}</th>
                        <th>{{trans('admin.hour')}}</th>
                        <th>{{trans('admin.status')}}</th>
                        <th>{{trans('admin.detail')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($reservations as $reservation)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$reservation->name}}</td>
                        <td>{{$reservation->day}}</td>
                        <td>{{$reservation->hour}}:00</td>
                        <td>{{$reservation->status_name}}</td>
                        <td><a class="btn btn-primary" href="{{url(route('hospital_show', $reservation->id))}}">{{trans('admin.show')}}</a></td>
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
