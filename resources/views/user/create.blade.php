@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Создать пользователя</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item active">Главная</li>
                </ol>
            </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
        <div class="container-fluid">
            <div class="row">
            <form action="{{ route('user.store') }}" method="POST">
                @csrf
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="Имя"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="password" placeholder="Пароль"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="password_confirmation" placeholder="Подтвердить пароль"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="surname" value="{{ old('surname') }}" placeholder="Фамилия"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="patronymic" value="{{ old('patronymic') }}" placeholder="Отчество"/>
                </div>
                <div class="form-group">
                    <label>Дата рождения</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                        </div>
                    <input type="text" class="form-control" name="birth_date" value="{{ old('birth_date') }}" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask>
                    </div>
                  <!-- /.input group -->
                </div>
                <div class="form-group">
                    <div class="input-group">
                    <input type="text" class="form-control" name="phone" value="{{ old('phone') }}"
                        data-inputmask='"mask": "+380 (99) 999-99-99"' data-mask>
                    @error('phone')
                        <div class="text-danger">{{ $message }}</div>
                    @enderror
                    </div>
                    <!-- /.input group -->
                </div>
                <div class="form-group">
                  <select name="region_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите регион</option>
                    @foreach($regions as $region)
                    <option {{ old('region_id') == $region->id ? ' selected' : '' }} value="{{ $region->id }}">{{ $region->title }}</option>
                    @endforeach
                  </select>
                    @error('region_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div> 
                <div class="form-group">
                    <input type="text" class="form-control" name="settlement" value="{{ old('settlement') }}" placeholder="Населений пункт"/>
                </div>
                <div class="form-group">
                    <select class="custom-select form-control-border" name="gender" id="exampleSelectBorder">
                        <option disabled selected>Пол</option>
                        <option {{ old('gender') == 1 ? ' selected' : '' }} value="1">Мужской</option>
                        <option {{ old('gender') == 2 ? ' selected' : '' }} value="2">Женский</option>
                    </select>
                </div>
                <div class="form-group">
                  <select name="role_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите роль</option>
                    @foreach($roles as $role)
                    <option {{ old('role_id') == $role->id ? ' selected' : '' }} value="{{ $role->id }}">{{ $role->title }}</option>
                    @endforeach
                  </select>
                    @error('role_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Добавить"/>
                </div>
            </form>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection