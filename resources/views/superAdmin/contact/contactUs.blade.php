@extends('common.index')
@section('page_title')
    {{trans('admin.contact')}}
@endsection
@section('content')

<div class="container-fluid contact-form">
    <div class="contact-image">
        <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
                <h3>{{trans('admin.contact')}}</h3>

    </div>
    @if(session()->has('error'))
        <div class="alert alert-danger" role="alert">
            {{session()->get('error')}}
        </div>
    @elseif(session()->has('message'))
        <div class="alert alert-success" role="alert">
            {{session()->get('message')}}
        </div>
    @endif
    <form method="post" action="{{route('store_contact')}}">
        @csrf
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="{{trans('admin.enter name')}}" value="{{ old('name') }}" required>
                </div>
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="{{trans('admin.enter email')}}" value="{{ old('email') }}" required>
                </div>
                <div class="form-group">
                    <input type="tel" pattern="^[0-9]*$" name="phone" class="form-control" maxlength="13" placeholder="{{trans('admin.enter phone')}}" value="{{ old('phone') }}" required>
                </div>
                
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <textarea name="message" class="form-control" placeholder="{{trans('admin.message')}}" style="width: 100%; height: 150px;" required>{{ old('message') }}</textarea>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group text-center">
                    <input type="submit" class="btnContact" value="{{trans('admin.send message')}}" />
                </div>
            </div>
        </div>
    </form>
</div>

@endsection