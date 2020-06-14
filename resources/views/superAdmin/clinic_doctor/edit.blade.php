@extends('common.index')
@section('page_title')
    {{trans('admin.edit doctor')}}
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
        <form method="post" action="{{route('update_doctor', $doctors[0]->id)}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="doctor_detail_name[1]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name english')}}" value="{{$doctors[0]->name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.name')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\s0-9_.,/{}@#!~%()<>-]+$" name="doctor_detail_name[2]" class="form-control" maxlength="50" placeholder="{{trans('admin.enter name arabic')}}" value="{{$doctors[1]->name}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.specialization')}} ({{trans('admin.english')}})</label>
                <input type="text" pattern="^[A-Za-z0-9_.,/{}@#!~%()-<>\s]+$" name="doctor_detail_specialization[1]" class="form-control" maxlength="160" placeholder="{{trans('admin.enter specialization')}}" value="{{$doctors[0]->specialization}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.specialization')}} ({{trans('admin.arabic')}})</label>
                <input type="text" pattern="^[\u0621-\u064A\u0660-\u0669\u06f0-\u06f9\u0600-\u06FF\sA-Za-z0-9_.,/{}@#!~%()<>-]+$" name="doctor_detail_specialization[2]" class="form-control" maxlength="160" placeholder="{{trans('admin.enter specialization')}}" value="{{$doctors[1]->specialization}}" required>
            </div>

            <div class="form-group">
                <label>{{trans('admin.start')}}</label>
                <select class="form-control" name="doctor_available_start">
                    @for ($i = 0; $i < 24; $i++)
                        @if($i < 10)
                            <option value="{{$i}}" {{$doctors[0]->start == $i ? 'selected' : ''}}>0{{$i}}:00</option>
                        @else
                            <option value="{{$i}}" {{$doctors[0]->start == $i ? 'selected' : ''}}>{{$i}}:00</option>
                        @endif
                    @endfor
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.end')}}</label>
                <select class="form-control" name="doctor_available_end">
                    @for ($i = 0; $i < 24; $i++)
                        @if($i < 10)
                            <option value="{{$i}}" {{$doctors[0]->end == $i ? 'selected' : ''}}>0{{$i}}:00</option>
                        @else
                            <option value="{{$i}}" {{$doctors[0]->end == $i ? 'selected' : ''}}>{{$i}}:00</option>
                        @endif
                    @endfor
                </select>
            </div>
            <div class="form-group">
                <label>{{trans('admin.price')}}</label>
                <input type="text" name="doctor_price" class="form-control" maxlength="50" placeholder="{{trans('admin.enter price')}}" value="{{$doctors[0]->price}}" required>
            </div>
            <div class="form-group">
                <label>{{trans('admin.activate')}}</label>
                <select class="form-control" name="active">
                    <option value="1" {{$doctors[0]->active == 1 ? 'selected':''}}>{{trans('admin.active')}}</option>
                    <option value="0" {{$doctors[0]->active == 0 ? 'selected':''}}>{{trans('admin.inactive')}}</option>
                </select>
            </div>
            @if(auth()->guard('admin')->user()->type == 1)
            <input type="hidden" name="clinic_id" value="{{$doctors[0]->clinic_id}}">
            @elseif(auth()->guard('admin')->user()->type == 2)
            <input type="hidden" name="clinic_id" value="{{auth()->guard('admin')->user()->type_id}}">
            @endif
            <br><br>
            <button type="submit" class="btn btn-primary">{{trans('admin.submit')}}</button>
            <br><br>
        </form>
    </div>

@endsection
