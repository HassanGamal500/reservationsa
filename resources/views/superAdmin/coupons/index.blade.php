@extends('common.index')
@section('page_title')
    {{trans('admin.coupons')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">
        <!-- Page Heading -->

    <div class="row py-3">
        <div class="col-md-6">
                <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.coupons') }}</h1>
            @if(session()->has('error'))
                <div class="alert alert-danger" role="alert">
                    {{session()->get('error')}}
                </div>
            @elseif(session()->has('message'))
                <div class="alert alert-success" role="alert">
                    {{session()->get('message')}}
                </div>
            @endif
        </div>
        <div class="col-md-6">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#coupon">{{trans('admin.add coupon')}}</button>

        </div>
    </div>

 
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all coupon') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable10" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.discount') }}</th>
                        <th>{{ trans('admin.numUse') }}</th>
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                        
                    @foreach($coupons as $coupon)
                    <!--href="{{url(route('edit_coupon', $coupon->id))}}"-->
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$coupon->name}}</td>
                        <td>%{{$coupon->discount}}</td>
                        <td>{{$coupon->uses}}</td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <button class="dropdown-item couponEdit" type="button"  data-target="#couponEdit" data-id="{{ $coupon->id }}">{{trans('admin.edit')}}</button>
                                    <button class="dropdown-item alertsCoupon" data-url="{{asset('admin/delete_coupon')}}/" data-id="{{ $coupon->id }}">{{trans('admin.delete')}}</button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Modal ADD-->
    <div class="modal fade" id="coupon" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{trans('admin.add coupon')}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form id="addCoupon">
              @csrf
              <div class="modal-body">
                <div class="form-group">
                    <label>{{trans('admin.name')}}</label>
                    <input type="text" name="coupon_name" class="form-control add_coupon_name" placeholder="Enter Name" required>
                </div>
                <div class="form-group">
                    <label>{{trans('admin.discount')}}</label>
                    <input type="number" name="coupon_discount" min="0" max="100" class="form-control add_discount" placeholder="Enter Discount" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('admin.close')}}</button>
                <button type="submit" class="btn btn-primary addCoupon">{{trans('admin.submit')}}</button>
              </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Modal EDIT-->
    <div class="modal fade" id="couponEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{trans('admin.edit coupon')}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form id="submitCoupon">
              @csrf
              <div class="modal-body">
                <input type="hidden" class="coupon_id" value="">
                <div class="form-group">
                    <label>{{trans('admin.name')}}</label>
                    <input type="text" name="coupon_name" class="form-control coupon_name" placeholder="{{trans('admin.enter name')}}" value="" required>
                </div>
                <div class="form-group" style="position:relative">
                    <label>{{trans('admin.discount')}}</label>
                    <span class="perscentage">%</span>
                    <input type="number" name="coupon_discount" min="0" max="100" class="form-control discount" placeholder="{{trans('admin.enter discount')}}" value="" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('admin.close')}}</button>
                <button type="submit" class="btn btn-primary submitCoupon">{{trans('admin.submit')}}</button>
              </div>
          </form>
        </div>
      </div>
    </div>
</div>
<!-- /.container-fluid -->
@endsection
