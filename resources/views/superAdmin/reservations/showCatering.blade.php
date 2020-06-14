@extends('common.index')
@section('page_title')
    {{trans('admin.detail reservation catering')}}
@endsection
@section('content')
<!-- Begin Page Content -->


    <div class="container-fluid" id="print_content">
        <div class="row">
            <div class="col-12">

                <!-- Main content -->
                <div class="invoice p-3 mb-3">
                    <!-- title row -->
                    <div class="row">
                        <div class="col-12">
                            <h4>
                                <i class="fas fa-globe"></i> {{trans('admin.reservation')}}
                            </h4>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-sm-4 invoice-col">

                            <address>
                                <strong>{{$reservation[0]->name}}</strong><br>
                                {{trans('admin.phone')}}: {{$reservation[0]->phone_code}}{{$reservation[0]->phone}}<br>
                                {{trans('admin.email')}}: {{$reservation[0]->email}}
                            </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">

                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            <b>{{trans('admin.hospital')}}:</b> {{$reservation[0]->catering_name}}<br>
                            <b>{{trans('admin.order id')}}:</b> {{$reservation[0]->id}}<br>
                            @if(isset($reservation[0]->payment))<b>{{trans('admin.payment due')}}:</b> {{$reservation[0]->payment}}<br>@endif
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- Table row -->
                    <div class="row">
                        <div class="col-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>{{trans('admin.price plan')}}</th>
                                    <th>{{trans('admin.date')}}</th>
                                    <th>{{trans('admin.day')}}</th>
                                    <th>{{trans('admin.num person')}}</th>
                                    <th>{{trans('admin.coupon code')}}</th>
                                    <th>{{trans('admin.sub price')}}</th>
                                    <th>{{trans('admin.status')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($reservation as $reserve)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$reserve->price_name}}</td>
                                    <td>{{$reserve->hour}}</td>
                                    <td>{{$reservation[0]->day}}</td>
                                    <td>{{$reserve->numPerson}}</td>
                                    <td>{{$reserve->coupon_code}}</td>
                                    <td>{{setting()->currency_name}} {{$reserve->subPrice}}</td>
                                    <td>{{$reserve->status_name}}</td>
                                </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-6">
                            <p class="lead">{{trans('admin.notice')}}:</p>
                            <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                                {{$reservation[0]->notice}}
                            </p>
                            @if(auth()->guard('admin')->user()->type != 5 && $reservation[0]->status_id == 1 || $reservation[0]->status_id == 2)
                                <p class="lead">{{trans('admin.status')}}:</p>
                                @if(session()->has('error'))
                                    <div class="alert alert-danger" role="alert">
                                        {{session()->get('error')}}
                                    </div>
                                @elseif(session()->has('message'))
                                    <div class="alert alert-success" role="alert">
                                        {{session()->get('message')}}
                                    </div>
                                @endif
                                <form action="{{route('status', $reservation[0]->id)}}" method="POST">
                                @csrf
                                    <div class="form-group">
                                        <select class="custom-select" name="status_name" required>
                                            <option disabled selected>{{trans('admin.select status')}}</option>
                                            @foreach($status as $stat)
                                            <option value="{{$stat->id}}">{{$stat->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="comment" class="form-control" placeholder="{{trans('admin.type comment')}}" value="">
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary" type="submit">{{trans('admin.update')}}</button>
                                    </div>
                                </form>
                                <br>
                            @endif
                            

                        </div>
                        <!-- /.col -->
                        <div class="col-6">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="width:50%">{{trans('admin.sub total')}}:</th>
                                        <td>{{setting()->currency_name}} {{$reservation[0]->subPrice}}</td>
                                    </tr>
                                    <tr>
                                        <th>{{trans('admin.discount')}}:</th>
                                        <td>%@if(isset($reservation[0]->discount)){{$reservation[0]->discount}} @else 0 @endif</td>
                                    </tr>
                                    <tr>
                                        <th>{{trans('admin.total')}}:</th>
                                        <td>{{setting()->currency_name}} @if(isset($reservation[0]->finalPrice)){{$reservation[0]->finalPrice}} @else {{$reservation[0]->subPrice}} @endif</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-12">
                            <div id="map" data-lat="{{$reservation[0]->latitude}}" data-long="{{$reservation[0]->longitude}}"></div>
                            <script>
                                function initMap() {
                                    var lat = $('#map').data("lat");
                                    var lng = $('#map').data("long");
                                    // The location of Uluru
                                    var uluru = {lat: lat, lng: lng};
                                    // The map, centered at Uluru
                                    var map = new google.maps.Map(
                                    document.getElementById('map'), {zoom: 15, center: uluru});
                                    // The marker, positioned at Uluru
                                    var marker = new google.maps.Marker({position: uluru, map: map});
                                }
                            </script>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- this row will not appear when printing -->

                </div>
                <!-- /.invoice -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                      <table class="table table-striped">
                                <thead>
                                    <tr>
                                      <th scope="col">{{trans('admin.history')}}</th>
                                      <th scope="col">{{trans('admin.status')}}</th>
                                      <th scope="col">{{trans('admin.comment')}}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($histories as $history)
                                    <tr>
                                      <td>{{$history->created_at}}</td>
                                      <td>{{$history->status_name}}</td>
                                      <td>{{$history->comment}}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                 </table>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row no-print">
            <div class="col-12">
                <button class="btn btn-primary float-right mr-2" onclick="printDiv('print_content')"><i class="fas fa-print"></i> {{trans('admin.print')}}</button>
            </div>
        </div>
    </div>

<!-- /.container-fluid -->
@endsection
