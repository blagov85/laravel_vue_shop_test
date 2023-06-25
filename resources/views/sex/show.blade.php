@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Інформація про стать</h1>
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
              <div class="card-header d-flex p-3">
                <div class="mr-3">
                  <a href="{{ route('sex.edit', $sex->id) }}" class="btn btn-primary">Редагувати</a>
                </div>
                @can('sex-delete-policy', App\Models\Sex::class)
                <form action="{{ route('sex.delete', $sex->id) }}" method="post">
                  @csrf
                  @method('delete')
                  <div class="form-group">
                    <input type="submit" class="btn btn-danger" value="Видалити"/>
                  </div>
                </form>
                @endcan
                 <!--<div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>

                </div>-->
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <tbody>
                    <tr>
                      <td>ID</td>
                      <td>{{ $sex->id }}</td>
                    </tr>
                    <tr>
                      <td>Назва</td>
                      <td>{{ $sex->title }}</a></td>
                    </tr>
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