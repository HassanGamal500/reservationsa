@extends('common.index')
@section('page_title')
    {{trans('admin.interests')}}
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">{{ trans('admin.interests') }}</h1>
    @if(session()->has('error'))
        <div class="alert alert-danger" role="alert">
            {{session()->get('error')}}
        </div>
    @elseif(session()->has('message'))
        <div class="alert alert-success" role="alert">
            {{session()->get('message')}}
        </div>
    @endif
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#interest">{{trans('admin.add interest')}}</button>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ trans('admin.all interest') }}</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable9" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>{{ trans('admin.name') }}</th>
                        <th>{{ trans('admin.numUser') }}</th>
                        <th>{{ trans('admin.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($interests as $interest)
                    <!--href="{{url(route('edit_interest', $interest->id))}}"-->
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$interest->name}}</td>
                        <td>{{$interest->users}}</td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{trans('admin.action')}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <button class="dropdown-item interestEdit" type="button"  data-target="#interestEdit" data-id="{{ $interest->id }}">{{trans('admin.edit')}}</button>
                                    <button class="dropdown-item alertsInterest" data-url="{{asset('admin/delete_interest')}}/" data-id="{{ $interest->id }}">{{trans('admin.delete')}}</button>
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
    <!-- Modal -->
    <div class="modal fade" id="interest" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{trans('admin.add interest')}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form method="POST" enctype="multipart/form-data" id="addInterest">
              @csrf
              <div class="modal-body">
                <div class="form-group">
                    <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                    <input type="text" name="add_interest_name_first[1]" class="form-control add_interest_name_first" placeholder="Enter Name English" value="" required>
                </div>
                <div class="form-group">
                    <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                    <input type="text" name="add_interest_name_second[2]" class="form-control add_interest_name_second" placeholder="Enter Name Arabic" value="" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('admin.close')}}</button>
                <input type="submit" class="btn btn-primary addInterest" value="{{trans('admin.submit')}}">
                <!--<span class="">{{trans('admin.')}}</span>-->
              </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Modal EDIT-->
    <div class="modal fade" id="interestEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{{trans('admin.edit interest')}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form enctype="multipart/form-data" id="submitInterest">
              @csrf
              <div class="modal-body">
                <input type="hidden" class="interest_id" value="">
                <div class="form-group">
                    <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                    <input type="text" name="interest_name[1]" class="form-control interest_name_first" placeholder="{{trans('admin.enter name english')}}" value="" required>
                </div>
                <div class="form-group">
                    <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                    <input type="text" name="interest_name[2]" class="form-control interest_name_second" placeholder="{{trans('admin.enter name arabic')}}" value="" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('admin.close')}}</button>
                <input type="submit" class="btn btn-primary submitInterest" value="{{trans('admin.submit')}}">
              </div>
          </form>
        </div>
      </div>
    </div>
</div>
<!-- /.container-fluid -->
@endsection
