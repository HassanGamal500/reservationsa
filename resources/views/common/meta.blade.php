<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <title>@yield('page_title')</title>
    
    <link rel=icon href="{{asset('images/user/ic_launcher.png')}}">

    <!-- Custom fonts for this template-->
    <link href="{{asset('panel/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->
    
    <link href="{{asset('panel/css/sb-admin-2.min.css')}}" rel="stylesheet">
    <link href="{{asset('panel/css/myStyle.css')}}" rel="stylesheet">
    
    @if(App::isLocale('ar')) 
        <link href="{{asset('panel/css/style-ar.css')}}" rel="stylesheet"> 
    @endif
    
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="{{asset('panel/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
    <link rel="manifest" href="{{asset('/manifest.json')}}">
    <link rel="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" rel="stylesheet">
    <!--Select 2-->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
    
    
</head>
