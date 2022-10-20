<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required Meta -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- addit -->
    <meta http-equiv="Cache-Control" content="max-age=0">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
    <!-- Title For This Document -->
    <title> Karte - Multipurpose E-Commerce Html Template</title>
    <!-- Favicon For This Document -->
    <link rel="shortcut icon" href="{{ asset('assets/images/logo/favicon-32x32.png') }}" type="image/x-icon">
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/select2/css/select2.min.css') }}">
    <!-- Bootstrap 5 Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.5.1.1.min.css') }}">
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- FlatIcon Css -->
    <link rel="stylesheet" href="{{ asset('assets/fonts/flaticon.css') }}">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Slick Slider Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/plugin/slick.css') }}">
    <!--  Ui Tabs Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/plugin/jquery-ui.min.css') }}">
    <!-- Magnific-popup Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/plugin/magnific-popup.css') }}">
    <!-- Nice Select Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/plugin/nice-select.v1.0.css') }}">
    <!-- Animate Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/plugin/animate.css') }}">
    <!-- Style Css -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    
</head>
    @yield('content')
    <!--==== Js Scripts Start ====-->
    <!-- Jquery v3.6.0 Js -->
    <script src="{{ asset('assets/js/jqurey.v3.6.0.min.js') }}"></script> <!-- Popper v2.9.3 Js -->
    <!-- jQuery -->
    <script src="{{ asset('adminlte/plugins/jquery/jquery.min.js') }}"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="{{ asset('adminlte/plugins/jquery-ui/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js') }}"></script>
    <!-- AdminLTE App -->
    <script src="{{ asset('adminlte/dist/js/adminlte.js') }}"></script>
    
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
    $.widget.bridge('uibutton', $.ui.button)
    </script>
    
    <script src="{{ asset('assets/js/popper.v2.9.3.min.js') }}"></script> <!-- Bootstrap v5.1.1 js -->
    <script src="{{ asset('assets/js/bootstrap.v5.1.1.min.js') }}"></script> <!-- jquery ui js -->
    <script src="{{ asset('assets/js/plugin/jquery-ui.min.js') }}"></script> <!-- Parallax js -->
    <script src="{{ asset('assets/js/plugin/jarallax.min.js') }}"></script> <!-- Isotope js -->
    <script src="{{ asset('assets/js/plugin/isotope.js') }}"></script> <!-- Slick Slider Js -->
    <script src="{{ asset('assets/js/plugin/slick.min.js') }}"></script> <!-- magnific-popup v2.3.4 Js -->
    <script src="{{ asset('assets/js/plugin/jquery.magnific-popup.min.js') }}"></script> <!-- Tweenmax v2.3.4 Js -->
    <script src="{{ asset('assets/js/plugin/tweenMax.min.js') }}"></script> <!-- Nice Select Js -->
    <script src="{{ asset('assets/js/plugin/nice-select.v1.0.min.js') }}"></script> <!-- Wow js -->
    <script src="{{ asset('assets/js/plugin/wow.v1.3.0.min.js') }}"></script> <!-- Wow js -->
    <script src="{{ asset('assets/js/plugin/jquery.countdown.min.js') }}"></script> <!-- Main js -->
    <!-- InputMask -->
    <script src="{{ asset('adminlte/plugins/moment/moment.min.js') }}"></script>
    <script src="{{ asset('adminlte/plugins/inputmask/jquery.inputmask.min.js') }}"></script>
    <script>
    $(function (){
        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        //Money Euro
        $('[data-mask]').inputmask()
    })
    
    </script>
    <script src="{{ asset('assets/js/main.js') }}"></script>
    
    <script src="{{ asset('js/app.js?n=1') }}" defer></script>
    <!--==== Js Scripts End ====-->
    
</html>