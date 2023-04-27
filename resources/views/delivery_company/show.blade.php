@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Інформація про транспортну компанію</h1>
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
                  <a href="{{ route('delivery_company.edit', $deliveryCompany->id) }}" class="btn btn-primary">Редагувати</a>
                </div>
                <form action="{{ route('delivery_company.delete', $deliveryCompany->id) }}" method="post">
                  @csrf
                  @method('delete')
                  <div class="form-group">
                    <input type="submit" class="btn btn-danger" value="Видалити"/>
                  </div>
                </form>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <tbody>
                    <tr>
                      <td>ID</td>
                      <td>{{ $deliveryCompany->id }}</td>
                    </tr>
                    <tr>
                      <td>Назва</td>
                      <td>{{ $deliveryCompany->title }}</a></td>
                    </tr>
                    <tr>
                      <td>Вартість</td>
                      <td>{{ $deliveryCompany->price }}</a></td>
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