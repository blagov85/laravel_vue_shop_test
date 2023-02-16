<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  <!-- Select2 -->
  <link rel="stylesheet" href="{{ asset('adminlte/plugins/select2/css/select2.min.css') }}">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset('adminlte/plugins/fontawesome-free/css/all.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('adminlte/dist/css/adminlte.min.css') }}">
   <!-- Summernote -->
  <link rel="stylesheet" href="{{ asset('adminlte/plugins/summernote/summernote-bs4.min.css') }}">
  <!-- Dropzone -->
  <link rel="stylesheet" href="{{ asset('adminlte/plugins/dropzone/min/dropzone.min.css') }}">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{ asset('adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">


  <link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.css" rel="stylesheet" />

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <p class="animation__shake">Магазин продуктов</p>
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light d-flex justify-content-between">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav">
      <li>
        <div class="form-group" style="text-align: center;margin-right:10px">
          <a href="{{ route('change-password') }}">Изменить пароль</a>
        </div>
      </li>
      <li class="nav-item">
        <form action="{{ route('logout') }}" method="post">
          @csrf
          <input class="btn btn-outline-primary" type="submit" value="Выйти">
        </form>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <span class="brand-text font-weight-light">Магазин продуктов</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

    <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          @can('order-policy', App\Models\Order::class)
          <li class="nav-item">
          <a href="{{ route('order.index') }}" class="nav-link">
              <i class="nav-icon fas fa-shopping-bag"></i>
              <p>Заказы</p>
            </a>
          </li>
          @endcan
          @can('product-policy', App\Models\Product::class)
          <li class="nav-item">
            <a href="{{ route('product.index') }}" class="nav-link">
            <i class="nav-icon fas fa-tshirt"></i>
              <p>Продукты</p>
            </a>
          </li>
          @endcan
          @can('category-policy', App\Models\Category::class)
          <li class="nav-item">
            <a href="{{ route('category.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Категории</p>
            </a>
          </li>
          @endcan
          @can('tag-policy', App\Models\Tag::class)
          <li class="nav-item">
            <a href="{{ route('tag.index') }}" class="nav-link">
            <i class="nav-icon fas fa-tags"></i>
              <p>Теги</p>
            </a>
          </li>
          @endcan
          @can('color-policy', App\Models\Color::class)
          <li class="nav-item">
            <a href="{{ route('color.index') }}" class="nav-link">
            <i class="nav-icon fas fa-palette"></i>
              <p>Цвета</p>
            </a>
          </li>
          @endcan
          @can('user-policy', App\Models\User::class)
          <li class="nav-item">
            <a href="{{ route('user.index') }}" class="nav-link">
            <i class="nav-icon fas fa-users"></i>
              <p>Пользователи</p>
            </a>
          </li>
          @endcan
          @can('role-policy', App\Models\Role::class)
          <li class="nav-item">
            <a href="{{ route('role.index') }}" class="nav-link">
            <i class="nav-icon fas fa-users"></i>
              <p>Роли</p>
            </a>
          </li>
          @endcan
          @can('group-policy', App\Models\Group::class)
          <li class="nav-item">
            <a href="{{ route('group.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Группы</p>
            </a>
          </li>
          @endcan
          @can('size-policy', App\Models\Size::class)
          <li class="nav-item">
            <a href="{{ route('size.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Размеры</p>
            </a>
          </li>
          @endcan
          @can('brand-policy', App\Models\Brand::class)
          <li class="nav-item">
            <a href="{{ route('brand.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Бренды</p>
            </a>
          </li>
          @endcan
          @can('material-policy', App\Models\Material::class)
          <li class="nav-item">
            <a href="{{ route('material.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Материалы</p>
            </a>
          </li>
          @endcan
          @can('country-policy', App\Models\Country::class)
          <li class="nav-item">
            <a href="{{ route('country.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Страны</p>
            </a>
          </li>
          @endcan
          @can('season-policy', App\Models\Season::class)
          <li class="nav-item">
            <a href="{{ route('season.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Сезоны</p>
            </a>
          </li>
          @endcan
          @can('sex-policy', App\Models\Sex::class)
          <li class="nav-item">
            <a href="{{ route('sex.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Пол</p>
            </a>
          </li>
          @endcan
          @can('feedback-policy', App\Models\Feedback::class)
          <li class="nav-item">
            <a href="{{ route('feedback.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Новые отзывы</p>
            </a>
          </li>
          @endcan
          @can('delivery-company-policy', App\Models\DeliveryCompany::class)
          <li class="nav-item">
            <a href="{{ route('delivery_company.index') }}" class="nav-link">
            <i class="nav-icon fas fa-list"></i>
              <p>Доставка</p>
            </a>
          </li>
          @endcan
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('content')
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; {{ now()->year }} <a href="{{ route('main.index') }}">Магазин продуктов</a>.</strong>
    Все права защищены
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="{{ asset('adminlte/plugins/jquery/jquery.min.js') }}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('adminlte/plugins/jquery-ui/jquery-ui.min.js') }}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{ asset('adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<!-- overlayScrollbars -->
<script src="{{ asset('adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- Upload File -->
<script src="{{ asset('adminlte/plugins/bs-custom-file-input/bs-custom-file-input.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('adminlte/dist/js/adminlte.js') }}"></script>
<!-- Summernote -->
<script src="{{ asset('adminlte/plugins/summernote/summernote-bs4.min.js') }}"></script>
<!-- Select2 -->
<script src="{{ asset('adminlte/plugins/select2/js/select2.full.min.js') }}"></script>
<!-- InputMask -->
<script src="{{ asset('adminlte/plugins/moment/moment.min.js') }}"></script>
<script src="{{ asset('adminlte/plugins/inputmask/jquery.inputmask.min.js') }}"></script>
<script>
  $(function () {
      bsCustomFileInput.init();
      $("select").select2({
        tags: true
      });

    $("select").on("select2:select", function (evt) {
      var element = evt.params.data.element;
      var $element = $(element);
      
      $element.detach();
      $(this).append($element);
      $(this).trigger("change");
    });

    $('.tags').select2();
    $('.colors').select2();
    $('.materials').select2();
    $('.seasons').select2();
    $('.percent_materials').select2();

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()
  });

  $(document).ready(function() {
  $('#summernote').summernote({
  toolbar: [
    // [groupName, [list of button]]
    ['style', ['bold', 'italic', 'underline', 'clear']],
    ['font', ['strikethrough', 'superscript', 'subscript']],
    ['fontsize', ['fontsize']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['height', ['height']]
  ],
  placeholder: 'Контент',
  height: 200
});
});

$(document).ready(function (e) {
  $('#select_preview_image').change(function(){
    let reader = new FileReader();
    reader.onload = (e) => { 
      $('#preview_image').attr('src', e.target.result); 
    }
    reader.readAsDataURL(this.files[0]); 
  });

  $('#select_product_image_1').change(function(){
      let reader = new FileReader();
      reader.onload = (e) => { 
        $('#product_image_1').attr('src', e.target.result); 
      }
      reader.readAsDataURL(this.files[0]); 
    });

  $('#select_product_image_2').change(function(){
      let reader = new FileReader();
      reader.onload = (e) => { 
        $('#product_image_2').attr('src', e.target.result); 
      }
      reader.readAsDataURL(this.files[0]); 
    });

    $('#select_product_image_3').change(function(){
      let reader = new FileReader();
      reader.onload = (e) => { 
        $('#product_image_3').attr('src', e.target.result); 
      }
      reader.readAsDataURL(this.files[0]); 
    });
});

</script>
</body>
</html>
