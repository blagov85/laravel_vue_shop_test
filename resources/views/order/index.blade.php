@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Заказы</h1>
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
            <div class="col-12">
            <div class="card">
              <div class="card-header">
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table>
                  <thead>
                    <tr>
                      <th width="15%">№</th>
                      <th width="15%">Дата</th>
                      <th width="20%">Статус</th>
                      <th width="20%">Оплата</th>
                      <th width="20%">Регион</th>
                      <th width="10%">Сума</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($orders as $order)
                    <tr>
                      <td width="15%"><a href="{{ route('order.show', $order->id) }}">#{{ $order->id }}</a></td>
                      <td width="15%">{{ $order->dateCreate }}</a></td>
                      <td width="20%">{{ $order->status->title }}</a></td>
                      <td width="20%">{{ $order->payment->title }}</a></td>
                      <td width="20%">{{ $order->region->title }}</a></td>
                      <td width="10%">{{ $order->total_price }}</a></td>
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