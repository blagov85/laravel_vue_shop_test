@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Редагувати користувача</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <div class="nav-link float-sm-right">
                    <a href="{{ route('change-password') }}">Змінити пароль</a>
                </div>
                <!-- <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item active">Главная</li>
                </ol> -->
            </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
        <div class="container-fluid">
            <div class="row">
            <form action="{{ route('user.update', $user->id) }}" method="POST">
                @csrf
                @method('patch')
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="{{ old('name') ?? $user->name }}" placeholder="Ім'я"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="surname" value="{{ old('surname') ?? $user->surname }}" placeholder="Прізвище"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="patronymic" value="{{ old('patronymic') ?? $user->patronymic }}" placeholder="По-батькові"/>
                </div>
                <div class="form-group">
                    <label>Дата народження</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                        </div>
                    <input type="text" class="form-control" name="birth_date" value="{{ old('birth_date') ?? $user->birth_date }}" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask>
                    </div>
                  <!-- /.input group -->
                </div>
                <div class="form-group">
                    <div class="input-group">
                    <input type="text" class="form-control" name="phone" value="{{ old('phone') ?? $user->phone }}"
                        data-inputmask='"mask": "+380 (99) 999-99-99"' data-mask>
                    @error('phone')
                        <div class="text-danger">{{ $message }}</div>
                    @enderror
                    </div>
                    <!-- /.input group -->
                </div>
                <div class="form-group">
                  <select name="region_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть регіон</option>
                    @foreach($regions as $region)
                    <option {{ (old('region_id') ?? $user->region_id) == $region->id  ? ' selected' : '' }} value="{{ $region->id }}">{{ $region->title }}</option>
                    @endforeach
                  </select>
                    @error('region_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div> 
                <div class="form-group">
                    <input type="text" class="form-control" name="settlement" value="{{ old('settlement') ?? $user->settlement }}" placeholder="Населений пункт"/>
                </div>
                <div class="form-group">
                    <select class="custom-select form-control-border" name="gender" id="exampleSelectBorder">
                        <option disabled selected>Стать</option>
                        <option {{ old('gender') == 1 || $user->gender == 1 ? ' selected' : '' }} value="1">Чоловік</option>
                        <option {{ old('gender') == 2 || $user->gender == 2 ? ' selected' : '' }} value="2">Жінка</option>
                    </select>
                </div>
                @can('user-policy', App\Models\User::class)
                <div class="form-group">
                  <select name="role_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть роль</option>
                    @foreach($roles as $role)
                    <option {{ $user->role_id == $role->id ? ' selected' : '' }} value="{{ $role->id }}">{{ $role->title }}</option>
                    @endforeach
                  </select>
                    @error('role_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                @else
                <div class="form-group">
                    <input type="hidden" name="role_id" value="{{ $user->role_id }}"/>
                    Роль - {{ $user->role->title }}
                </div>
                @endcan
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Редагувати"/>
                </div>
            </form>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection