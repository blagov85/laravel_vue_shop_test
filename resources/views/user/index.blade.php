@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Користувачі</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
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
            <div class="col-12">
            <div class="card">
              <div class="card-header">
                <a href="{{ route('user.create') }}" class="btn btn-primary">Додати</a>
                <!-- <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div> -->
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Ім'я</th>
                      <th>Прізвище</th>
                      <th>По-батькові</th>
                      <th>Email</th>
                      <th>Дата народження</th>
                      <th>Стать</th>
                      <th>Роль</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($users as $user)
                    <tr>
                      <td>{{ $user->id }}</td>
                      @if(Auth::user()->isSuperAdmin() || Auth::user()->isAdmin())
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->name }}</a></td>
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->surname }}</a></td>
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->patronymic }}</a></td>
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->email }}</a></td>
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->birth_date }}</a></td>
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->genderTitle }}</a></td>
                        <td><a href="{{ route('user.show', $user->id) }}">{{ $user->role->title }}</a></td>
                      @else
                        <td>{{ $user->name }}</td>
                        <td>{{ $user->surname }}</td>
                        <td>{{ $user->patronymic }}</td>
                        <td>{{ $user->email }}</td>
                        <td>{{ $user->birth_date }}</td>
                        <td>{{ $user->genderTitle }}</td>
                        <td>{{ $user->role->title }}</td>
                      @endif
                    </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection