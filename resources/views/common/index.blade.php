<!DOCTYPE html>
<html lang="en">
@include('common.meta')
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

@include('common.sidebar')
<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            @include('common.nav')

            @yield('content')

        </div>

        @include('common.footer')

    </div>
</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

@include('common.modal')
@include('common.script')
</body>
</html>
