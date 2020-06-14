<!-- Bootstrap core JavaScript-->
<!--<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>


<script src="{{asset('panel/vendor/jquery/jquery.min.js')}}"></script>
<script src="{{asset('panel/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

<!-- Core plugin JavaScript-->
<script src="{{asset('panel/vendor/jquery-easing/jquery.easing.min.js')}}"></script>

<!-- Custom scripts for all pages-->
<script src="{{asset('panel/js/sb-admin-2.min.js')}}"></script>

<!-- Page level plugins -->
{{--<script src="{{asset('panel/vendor/chart.js/Chart.min.js')}}"></script>--}}
<script src="{{asset('panel/vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('panel/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALuXnyfDaPxuWG1yCF2esWqqJ6prtNPbg&callback=initMap">
</script>
<script src="{{asset('panel/ckeditor/ckeditor.js')}}"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Page level custom scripts -->
<script src="{{asset('panel/js/demo/datatables-demo.js')}}"></script>
<!--selectize-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js"></script>
<!--Select 2-->
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script>


<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-app.js"></script>


<!-- If you enabled Analytics in your project, add the Firebase SDK for Analytics -->
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-analytics.js"></script>

<!-- Add Firebase products that you want to use -->
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.6.0/firebase-messaging.js"></script>


<script type="application/javascript">

    // Your web app's Firebase configuration
    var firebaseConfig = {
        apiKey: "AIzaSyCg2P-ax3ekqBkk6M8u-zXkbdyb65pd7cs",
        authDomain: "reservation-faffa.firebaseapp.com",
        databaseURL: "https://reservation-faffa.firebaseio.com",
        projectId: "reservation-faffa",
        storageBucket: "reservation-faffa.appspot.com",
        messagingSenderId: "345267501157",
        appId: "1:345267501157:web:4a019585bf1c56393c6e8c",
        measurementId: "G-ZBT1031YK0"
    };
    
    firebase.initializeApp(firebaseConfig);
    
    if(firebase.messaging.isSupported()) {
        const messaging = firebase.messaging();

        // Add the public key generated from the console here.
        messaging.usePublicVapidKey("BIkjfKt7n0NdZjP-7VBLtsarTIKqknDJpbtgqj7o8wqFVVRZ0x5lous_yPhtVcJ7sRHMOVPpo8EAkrXNLsxDejA");
        Notification.requestPermission().then((permission) => {
            if (permission === 'granted') {
                console.log('Notification permission granted.');
                // TODO(developer): Retrieve an Instance ID token for use with FCM.
                getRegisterToken();
                // ...
            } else {
                console.log('Unable to get permission to notify.');
            }
        });
        
    	function getRegisterToken() {
    	    // Get Instance ID token. Initially this makes a network call, once retrieved
        	// subsequent calls to getToken will return from cache.
            messaging.getToken().then((currentToken) => {
                if (currentToken) {
                    saveToken(currentToken);
                	console.log(currentToken);
                    sendTokenToServer(currentToken);
                    // updateUIForPushEnabled(currentToken);
                } else {
                    // Show permission request.
                    console.log('No Instance ID token available. Request permission to generate one.');
                    // Show permission UI.
                    // updateUIForPushPermissionRequired();
                    setTokenSentToServer(false);
                }
            }).catch((err) => {
                console.log('An error occurred while retrieving token. ', err);
                // showToken('Error retrieving Instance ID token. ', err);
                setTokenSentToServer(false);
            });
    	}
    
        
        // // Callback fired if Instance ID token is updated.
        // messaging.onTokenRefresh(() => {
        //     messaging.getToken().then((refreshedToken) => {
        //         console.log('Token refreshed.');
        //         // Indicate that the new Instance ID token has not yet been sent to the
        //         // app server.
        //         setTokenSentToServer(false);
        //         // Send Instance ID token to app server.
        //         sendTokenToServer(refreshedToken);
        //         // ...
        //     }).catch((err) => {
        //         console.log('Unable to retrieve refreshed token ', err);
        //         // showToken('Unable to retrieve refreshed token ', err);
        //     });
        // });
        
        // Send the Instance ID token your application server, so that it can:
        // - send messages back to this app
        // - subscribe/unsubscribe the token from topics
        function sendTokenToServer(currentToken) {
            if (!isTokenSentToServer()) {
                console.log('Sending token to server...');
                // TODO(developer): Send the current token to your server.
                setTokenSentToServer(true);
            } else {
                console.log('Token already sent to server so won\'t send it again ' + 'unless it changes');
            }
        }
        
        function isTokenSentToServer() {
            return window.localStorage.getItem('sentToServer') === '1';
        }
        
        function setTokenSentToServer(sent) {
            window.localStorage.setItem('sentToServer', sent ? '1' : '0');
        }
        
        function saveToken(currentToken){
            jQuery.ajax({
                data: {"token":currentToken},
                type: "post",
                url: '{{url(route('getToken'))}}',
                success: function(result){
                    console.log(result);
                }
            });
        }
        
        // function type(){
        //     jQuery.ajax({
        //         type: "get",
        //         url: '{{url(route('getType'))}}',
        //         success: function(result){
        //             console.log(result);
        //             if(result == 1){
                        
        //                 $.ajax({
        //                     cache: false,
        //                     type: 'GET',
        //                     url: '{{ url(route('contact_count')) }}',
        //                     success:function(data){
        //                         $('#notifyCount').removeClass('badge badge-danger float-right').text('');
        //                         $('#notifyCount').addClass('badge badge-danger float-right').text(data);
        //                         $('#messageCount').addClass('badge badge-danger badge-counter').text('');
        //                         $('#messageCount').addClass('badge badge-danger badge-counter').text(data);
        //                     }
        //                 });
                        
        //                 $.ajax({
        //                     cache: false,
        //                     type: 'POST',
        //                     url: '{{ url(route('contact_notify')) }}',
        //                     success:function(data){
        //                         document.getElementById('mysound').play();
        //                     }
        //                 });
                        
        //                 swal("{{trans('admin.new contact')}}");
                        
        //             } else {
                        
        //                 $.ajax({
        //                     cache: false,
        //                     type: 'GET',
        //                     url: '{{ url(route('reserve_count')) }}',
        //                     success:function(data){
        //                         $('#reserveCount').removeClass('badge badge-danger float-right').text('');
        //                         $('#reserveCount').addClass('badge badge-danger float-right').text(data);
        //                     }
        //                 });
                        
        //                 $.ajax({
        //                     cache: false,
        //                     type: 'POST',
        //                     url: '{{ url(route('reserve_notify')) }}',
        //                     success:function(data){
        //                         document.getElementById('mysound').play();
        //                     }
        //                 });
                        
        //                 swal("{{trans('admin.new order')}}");
                        
        //             }
        //         }
        //     });
        // }
        
        function sweet(type){
            if(type == '1') {
                $.ajax({
                    cache: false,
                    type: 'GET',
                    url: '{{ url(route('contact_count')) }}',
                    success:function(data){
                        $('#notifyCount').removeClass('badge badge-danger float-right').text('');
                        $('#notifyCount').addClass('badge badge-danger float-right').text(data);
                        $('#messageCount').addClass('badge badge-danger badge-counter').text('');
                        $('#messageCount').addClass('badge badge-danger badge-counter').text(data);
                    }
                });
                
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: '{{ url(route('contact_notify')) }}',
                    success:function(data){
                        document.getElementById('mysound').play();
                    }
                });
                
                swal("{{trans('admin.new contact')}}");
            } else if(type == '2') {
                $.ajax({
                    cache: false,
                    type: 'GET',
                    url: '{{ url(route('reserve_count')) }}',
                    success:function(data){
                        $('#reserveCount').removeClass('badge badge-danger float-right').text('');
                        $('#reserveCount').addClass('badge badge-danger float-right').text(data);
                    }
                });
                
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: '{{ url(route('reserve_notify')) }}',
                    success:function(data){
                        document.getElementById('mysound').play();
                    }
                });
                
                swal("{{trans('admin.new order')}}");
            } else {
                console.log(type);
                document.getElementById('mysound').play();
                swal("{{trans('admin.order canceled')}}");
            }
        }
        
        messaging.onMessage(function(payload) {
            console.log('Message received. ', payload);
            var type = payload.data.type;
            console.log(type);
            sweet(type);
            var title =payload.data.title;
            
            var options ={
                body: payload.data.body,
                icon: payload.data.icon,
                image: payload.data.image,
                data:{
                    time: new Date(Date.now()).toString(),
                    click_action: payload.data.click_action
                }
            };
            var myNotification = new Notification(title, options);
        });
    } else {
        console.log('Firebase Is Not Support');
    }
    
    
    

    function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
    }

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(document).ready(function() {
        
        $(".searchOption2").select2( {
            placeholder: "Select Email",
            allowClear: true,
            width: 'resolve'
        } );

        // $('.nav-item').on('click', function () {
        //     $(this).siblings().removeClass('active');
        //     $(this).toggleClass('active');
        // });
        
        $.ajax({
            cache: false,
            type: 'GET',
            url: '{{ url(route('reserve_count')) }}',
            success:function(data){
                if(data > 0){
                    $('#reserveCount').removeClass('badge badge-danger float-right').text('');
                    $('#reserveCount').addClass('badge badge-danger float-right').text(data);
                }
            }
        });
        
        $.ajax({
            cache: false,
            type: 'GET',
            url: '{{ url(route('contact_count')) }}',
            success:function(data){
                if(data > 0){
                    $('#notifyCount').removeClass('badge badge-danger float-right').text('');
                    $('#notifyCount').addClass('badge badge-danger float-right').text(data);
                    $('#messageCount').addClass('badge badge-danger badge-counter').text('');
                    $('#messageCount').addClass('badge badge-danger badge-counter').text(data);
                }
            }
        });

        $(document).on('click', '.alerts', function(e){
            var url = $(this).data("url");
            var id = $(this).data("id");
            e.preventDefault();
            swal({
                title: "{{trans('admin.sure')}}",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })

            .then((willDelete) => {
                if (willDelete) {
                    swal("{{trans('admin.will delete')}}", {
                        icon: "success",
                    });
                    $.ajax({
                        type: 'DELETE',
                        url: url+id,
                        // dataType: 'JSON',
                        data: {id: id},
                        success:function(data){
                            // setInterval(function () {
                            //     $('#dataTable').DataTable().ajax.reload();
                            // }, 2000)
                            location.reload();
                        }
                    });
                } else {
                    swal("{{trans('admin.not delete')}}");
                }
            });
        })
        
        $(document).on('click', '.alertsCoupon', function(e){
            var url = $(this).data("url");
            var id = $(this).data("id");
            e.preventDefault();
            swal({
                title: "{{trans('admin.sure')}}",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })

            .then((willDelete) => {
                if (willDelete) {
                    swal("{{trans('admin.will delete')}}", {
                        icon: "success",
                    });
                    $.ajax({
                        type: 'DELETE',
                        url: url+id,
                        // dataType: 'JSON',
                        data: {id: id},
                        success:function(data){
                            // setInterval(function () {
                            //     $('#dataTable').DataTable().ajax.reload();
                            // }, 2000)
                            // location.reload();
                            var datatable = $('#dataTable10').DataTable();
                            datatable.clear();
                            var i;
                            for (i = 0; i < data.length; i++) {
                                datatable.row.add( [
                                    i+1,
                                    data[i].name,
                                    '%' + data[i].discount,
                                    data[i].uses,
                                    '<div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('admin.action')}}</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><button class="dropdown-item couponEdit" type="button"  data-target="#couponEdit" data-id="'+ data[i].id +'">{{trans('admin.edit')}}</button><button class="dropdown-item alertsCoupon" data-url="{{asset('admin/delete_coupon')}}/" data-id="'+ data[i].id +'">{{trans('admin.delete')}}</button></div></div>'
                                ] ).draw(false);
                            }
                        }
                    });
                } else {
                    swal("{{trans('admin.not delete')}}");
                }
            });
        })
        
        $(document).on('click', '.alertsInterest', function(e){
            var url = $(this).data("url");
            var id = $(this).data("id");
            e.preventDefault();
            swal({
                title: "{{trans('admin.sure')}}",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })

            .then((willDelete) => {
                if (willDelete) {
                    swal("{{trans('admin.will delete')}}", {
                        icon: "success",
                    });
                    $.ajax({
                        type: 'DELETE',
                        url: url+id,
                        data: {id: id},
                        success:function(data){
                            var datatable = $('#dataTable9').DataTable();
                            datatable.clear();
                            var i;
                            for (i = 0; i < data.length; i++) {
                                datatable.row.add( [
                                    i+1,
                                    data[i].name,
                                    data[i].users,
                                    '<div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('admin.action')}}</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><button class="dropdown-item interestEdit" type="button"  data-target="#interestEdit" data-id="'+ data[i].id +'">{{trans('admin.edit')}}</button><button class="dropdown-item alertsInterest" data-url="{{asset('admin/delete_interest')}}/" data-id="'+ data[i].id +'">{{trans('admin.delete')}}</button></div></div>'
                                ] ).draw( false );
                            }
                        }
                    });
                } else {
                    swal("{{trans('admin.not delete')}}");
                }
            });
        })
        
        // var old_notifty = 0;
        // setInterval(function(){
        //     $.ajax({
        //         cache: false,
        //         type: 'POST',
        //         url: '{{ url(route('contact_notify')) }}',
        //         success:function(data){
        //             if (data > old_notifty) {
        //                 old_notifty = data;
        //                 document.getElementById('mysound').play();
        //             }
        //         }
        //     });
        // }, 2000)
        
        // var old_count = 0;
        // setInterval(function(){
        //     $.ajax({
        //         cache: false,
        //         type: 'GET',
        //         url: '{{ url(route('contact_count')) }}',
        //         success:function(data){
        //             if (data > old_count) {
        //                 $('#notifyCount').removeClass('badge badge-danger float-right').text('');
        //                 $('#notifyCount').addClass('badge badge-danger float-right').text(data);
        //                 $('#messageCount').addClass('badge badge-danger badge-counter').text('');
        //                 $('#messageCount').addClass('badge badge-danger badge-counter').text(data);
        //                 old_count = data;
        //                 // var sound = new Audio("{{asset('panel/sound/not-bad.mp3')}}");
        //                 // sound.play();    
        //                 // $('audio #mysound').attr('src', "{{asset('panel/sound/not-bad.mp3')}}");
        //                 // $('audio').load();
        //                 // $('audio').play();
        //                 // document.getElementById('mysound').play();
        //             }
        //         }
        //     });
        // }, 2000)
        
        // var old_notifty_reserve = 0;
        // setInterval(function(){
        //     $.ajax({
        //         cache: false,
        //         type: 'POST',
        //         url: '{{ url(route('reserve_notify')) }}',
        //         success:function(data){
        //             if (data > old_notifty_reserve) {
        //                 old_notifty_reserve = data;
        //                 document.getElementById('mysound').play();
        //             }
        //         }
        //     });
        // }, 2000)
        
        // var old_reserve = 0;
        // setInterval(function(){
        //     $.ajax({
        //         cache: false,
        //         type: 'GET',
        //         url: '{{ url(route('reserve_count')) }}',
        //         success:function(data){
        //             if (data > old_count) {
        //                 $('#reserveCount').removeClass('badge badge-danger float-right').text('');
        //                 $('#reserveCount').addClass('badge badge-danger float-right').text(data);
        //                 old_reserve = data;
        //             }
        //         }
        //     });
        // }, 2000)

    });
    

    // Activate
    $('.toggle-class').change(function() {
        var status = $(this).prop('checked') == true ? 1 : 0; 
        var id = $(this).data('id'); 
        var type = $(this).data('type'); 
         
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '{{url('admin/changeStatus')}}',
            data: {'status': status, 'id': id, 'type': type},
            success: function(data){
            //   console.log(data.success)
            }
        });
    })
    
    // Modal Edit Coupon Show
    $(document).on('click', '.couponEdit', function() {
        var id = $(this).data('id'); 

        $.ajax({
            type: "POST",
            dataType: "json",
            url: '{{url('admin/getCoupon')}}',
            data: {'id': id},
            success: function(data){
            //   console.log(data.coupon_name);
            // $('#couponEdit').show();
            var coupon_id = data.coupon_id;
            // $('.update').attr('action', '{{route("update_coupon", 'coupon_id')}}');
            $(".coupon_id").val(data.coupon_id);
            $(".coupon_name").val(data.coupon_name);
            $(".discount").val(data.coupon_discount);
            $('#couponEdit').modal('show');
            }
        });
    })
    
    
    
    // Modal add Coupon Store
    $('#addCoupon').on('submit', function(e) {
        e.preventDefault();
        var coupon_name = $('.add_coupon_name').val();
        var coupon_discount = $('.add_discount').val();
        var datatable = $('#dataTable10').DataTable();
        if(typeof(coupon_name) != "undefined" && coupon_name !== null){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '{{url('admin/addCoupon')}}',
                data: {'coupon_name': coupon_name, 'coupon_discount': coupon_discount},
                success: function(data){
                    $('#coupon').modal('hide');
                    $(".add_coupon_name").val('');
                    $(".add_discount").val('');
                    if(data['status'] == 1){
                        datatable.clear();
                        var i;
                        for (i = 0; i < data['data'].length; i++) {
                            datatable.row.add( [
                                i+1,
                                data['data'][i].name,
                                '%' + data['data'][i].discount,
                                data['data'][i].uses,
                                '<div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('admin.action')}}</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><button class="dropdown-item couponEdit" type="button"  data-target="#couponEdit" data-id="'+ data['data'][i].id +'">{{trans('admin.edit')}}</button><button class="dropdown-item alertsCoupon" data-url="{{asset('admin/delete_coupon')}}/" data-id="'+ data['data'][i].id +'">{{trans('admin.delete')}}</button></div></div>'
                            ] ).draw(false);
                        }
                        swal("{{trans('admin.Inserted Successfully!')}}", "", "success");
                    } else {
                        swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                        // console.log(data['message']);
                    }
                },
                error: function(data){
                    swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                }
            });
        }
    })
    
    // Modal Edit Coupon Update
    $('#submitCoupon').on('submit', function(e) {
        e.preventDefault();
        var id = $('.coupon_id').val();
        var coupon_name = $('.coupon_name').val();
        var coupon_discount = $('.discount').val();
        var datatable = $('#dataTable10').DataTable();
        if(typeof(coupon_name) != "undefined" && coupon_name !== null){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '{{url('admin/updateCoupon')}}',
                data: {'id': id, 'coupon_name': coupon_name, 'coupon_discount': coupon_discount},
                success: function(data){
                    $('#couponEdit').modal('hide');
                    if(data['status'] == 1){
                        datatable.clear();
                        var i;
                        for (i = 0; i < data['data'].length; i++) {
                            datatable.row.add( [
                                i+1,
                                data['data'][i].name,
                                '%' + data['data'][i].discount,
                                data['data'][i].uses,
                                '<div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('admin.action')}}</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><button class="dropdown-item couponEdit" type="button"  data-target="#couponEdit" data-id="'+ data['data'][i].id +'">{{trans('admin.edit')}}</button><button class="dropdown-item alertsCoupon" data-url="{{asset('admin/delete_coupon')}}/" data-id="'+ data['data'][i].id +'">{{trans('admin.delete')}}</button></div></div>'
                            ] ).draw(false);
                        }
                        swal("{{trans('admin.Inserted Successfully!')}}", "", "success");
                    } else {
                        swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                    }
                },
                error: function(data){
                    swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                }
            });
        }
    })
    
    // Modal Edit interest Show
    $(document).on('click', '.interestEdit', function() {
        var id = $(this).data('id'); 

        $.ajax({
            type: "POST",
            dataType: "json",
            url: '{{url('admin/getInterest')}}',
            data: {'id': id},
            success: function(data){
                // console.log(data);
                var interest_id = data.interest_id;
                $(".interest_id").val(data[0].interest_id);
                $(".interest_name_first").val(data[0].interest_name);
                $(".interest_name_second").val(data[1].interest_name);
                $('#interestEdit').modal('show');
            }
        });
    })
    
    // Modal add Interest Store
    // $('.addInterest').click(function() {
    $('#addInterest').on('submit',function(e){
        e.preventDefault();
        var add_interest_name_first = $('.add_interest_name_first').val();
        var add_interest_name_second = $('.add_interest_name_second').val();
        var datatable = $('#dataTable9').DataTable();
        console.log(add_interest_name_first, add_interest_name_second);
        if(typeof(add_interest_name_first) != "undefined" && add_interest_name_first !== null){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '{{url('admin/addInterest')}}',
                data: {'interest_name[1]': add_interest_name_first, 'interest_name[2]': add_interest_name_second},
                // processData: false,
                // contentType: false,
                // cache: false,
                // timeout: 800000,
                success: function(data){
                    // console.log(data);
                    $('#interest').modal('hide');
                    $(".add_interest_name_first").val('');
                    $(".add_interest_name_second").val('');
                    if(data['status'] == 1){
                        datatable.clear();
                        var i;
                        for (i = 0; i < data['data'].length; i++) {
                            datatable.row.add( [
                                i+1,
                                data['data'][i].name,
                                data['data'][i].users,
                                '<div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('admin.action')}}</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><button class="dropdown-item interestEdit" type="button"  data-target="#interestEdit" data-id="'+ data['data'][i].id +'">{{trans('admin.edit')}}</button><button class="dropdown-item alertsInterest" data-url="{{asset('admin/delete_interest')}}/" data-id="'+ data['data'][i].id +'">{{trans('admin.delete')}}</button></div></div>'
                            ] ).draw( false );
                        }
                        swal("{{trans('admin.Inserted Successfully!')}}", "", "success");
                    } else {
                        swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                    }
                },
                error: function(data){
                    swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                }
            });
        }
            
    })
    
    // Modal Edit interest Update
    $('#submitInterest').on('submit', function(e) {
        e.preventDefault();
        var id = $('.interest_id').val();
        var interest_name_first = $('.interest_name_first').val();
        var interest_name_second = $('.interest_name_second').val();
        var datatable = $('#dataTable9').DataTable();
        if(typeof(interest_name_first) != "undefined" && interest_name_first !== null){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: '{{url('admin/updateInterest')}}',
                data: {'id': id, 'interest_name[1]': interest_name_first, 'interest_name[2]': interest_name_second},
                success: function(data){
                    // console.log(data['data']);
                    $('#interestEdit').modal('hide');
                    // location.reload();
                    if(data['status'] == 1){
                        datatable.clear().draw();
                        var i;
                        for (i = 0; i < data['data'].length; i++) {
                            datatable.row.add( [
                                i+1,
                                data['data'][i].name,
                                data['data'][i].users,
                                '<div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('admin.action')}}</button><div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><button class="dropdown-item interestEdit" type="button"  data-target="#interestEdit" data-id="'+ data['data'][i].id +'">{{trans('admin.edit')}}</button><button class="dropdown-item alertsInterest" data-url="{{asset('admin/delete_interest')}}/" data-id="'+ data['data'][i].id +'">{{trans('admin.delete')}}</button></div></div>'
                            ] ).draw( false );
                        }
                        swal("{{trans('admin.Inserted Successfully!')}}", "", "success");
                    } else {
                        swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                    }
                },
                error: function(data){
                    swal("{{trans('admin.ERROR!')}}", data['message'], "error");
                }
            });
        }
        
    })
    
    var i = 0;

    $("#more").click(function(){
        ++i;
        $(".row_more").append('<br><input type="file" name="image['+i+']" class="form-control-file" placeholder="Enter Image" required>');
    });
    
    $('#selectOption').on('change', function(){
        if ($(this).val() == '2') {
            // $('#notEmail').removeAttr('disabled');
            $('#show_hide').show(1000);
        } else {
            // $('#notEmail').attr('disabled', 'disabled');
            $('#show_hide').hide(1000);
        }
    });
    
    // Page 
    
    CKEDITOR.replace( 'articleContentEN' );
    CKEDITOR.replace( 'articleContentAR' );
    
    // Map 
    
    // Initialize and add the map
    // function initMap() {
    //     var lat = $('#map').data("lat");
    //     var lng = $('#map').data("long");
    //     // The location of Uluru
    //     var uluru = {lat: lat, lng: lng};
    //     // The map, centered at Uluru
    //     var map = new google.maps.Map(
    //     document.getElementById('map'), {zoom: 12, center: uluru});
    //     // The marker, positioned at Uluru
    //     var marker = new google.maps.Marker({position: uluru, map: map});
    // }
    
    
    // Advertisements 
    $('.type').on('change', function() {
        var type = $(this).val(); 
        // var id = $(this).data('id'); 
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '{{url('admin/get_services')}}',
            data: {'type': type},
            success: function(data){
                // console.log(data);
                // $('.type_id').append(data);
                var append = "<option disabled selected>{{trans('admin.select Type')}}</option>";
                for (i = 0; i < data.length; i++) {
                    append += "<option value='"+ data[i].id +"'>"+ data[i].name +"</option>"
                }
                $('.type_id').html(append);
            }
        });
    })
    
    // Services  
    $('.country_id').on('change', function() {
        var type = $(this).val(); 
        // var id = $(this).data('id'); 
        console.log(type);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: '{{url('admin/get_city')}}',
            data: {'country_id': type},
            success: function(data){
                var append = "<option disabled selected>{{trans('admin.select city')}}</option>";
                for (i = 0; i < data.length; i++) {
                    append += "<option value='"+ data[i].id +"'>"+ data[i].name +"</option>"
                }
                $('.city_id').html(append);
            }
        });
    })

    // $('.datatableContact').DataTable({
    //     columns: [
    //      { width: '15%' },
    //      { width: '15%' },
    //      { width: '15%' },
    //      { width: '15%' },
    //      { width: '30%' },
    //      { width: '10%' }
    //   ]
    // }).columns.adjust();
    

</script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
