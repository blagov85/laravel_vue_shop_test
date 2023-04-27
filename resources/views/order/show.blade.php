@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Інформація про замовлення</h1>
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
                  <a href="{{ route('order.edit', $order->id) }}" class="btn btn-primary">Редагувати</a>
                </div>
                <form action="{{ route('order.delete', $order->id) }}" method="post">
                  @csrf
                  @method('delete')
                  <div class="form-group">
                    <input type="submit" class="btn btn-danger" value="Видалити"/>
                  </div>
                </form>
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
                <div class="header">
                    <h5>Замовлення <span>#{{ $order->id }}</span></h5>
                </div>
                <div>
                </div>
                <div class="header-table">Інформація про замовлення</div>
                <form action="{{ route('order.change_status.update', $order->id) }}" method="POST">
                  @csrf
                  @method('patch')
                  <table class="info-order-table">
                    <tr>
                        <td class="head">Дата</td>
                        <td>{{ $order->dateCreate }}</td>
                    </tr>
                    <tr>
                        <td class="head">Прізвище</td>
                        <td>{{ $order->surname }}</td>
                    </tr>
                    <tr>
                        <td class="head">Ім'я</td>
                        <td>{{ $order->name }}</td>
                    </tr>
                    <tr>
                        <td class="head">Телефон</td>
                        <td>{{ $order->phone }}</td>
                    </tr>
                    <tr>
                        <td class="head">Email</td>
                        <td>{{ $order->email }}</td>
                    </tr>
                    <tr>
                        <td class="head">Область</td>
                        <td>{{ $order->region->title }}</td>
                    </tr>
                    <tr>
                        <td class="head">Місто</td>
                        <td>{{ $order->settlement }}</td>
                    </tr>
                    <tr>
                        <td class="head">Служба доставки</td>
                        <td>{{ $order->delivery_company->title }}</td>
                    </tr>
                    <tr>
                        <td class="head">Відділення</td>
                        <td>{{ $order->department_DC }}</td>
                    </tr>
                    <tr>
                        <td class="head">Оплата</td>
                        <td>
                          <div class="form-group">
                            <select name="payment_id" class="form-control select2">
                              <option selected="selected" disabled>Выберіть статус оплати</option>
                              @foreach($payments as $payment)
                              <option {{ $order->payment_id == $payment->id ? ' selected' : '' }} value="{{ $payment->id }}">{{ $payment->title }}</option>
                              @endforeach
                            </select>
                              @error('payment_id')
                              <div class="text-danger">{{ $message }}</div>
                              @enderror
                          </div>  
                        </td>
                    </tr>
                    <tr>
                        <td class="head">Статус замовлення</td>
                        <td>
                          <div class="form-group">
                            <select name="status_id" class="form-control select2">
                              <option selected="selected" disabled>Выберіть статус замовлення</option>
                              @foreach($statuses as $status)
                              <option {{ $order->status_id == $status->id ? ' selected' : '' }} value="{{ $status->id }}">{{ $status->title }}</option>
                              @endforeach
                            </select>
                              @error('status_id')
                              <div class="text-danger">{{ $message }}</div>
                              @enderror
                          </div>  
                        </td>
                    </tr>
                    <tr>
                      <td class="head"></td>
                      <td>
                        <div class="form-group">
                          <input type="submit" class="btn btn-primary" value="Застосувати статуси"/>
                        </div>
                      </td>
                    </tr>
                  </table>
                </form>
                <br>
                <table class="order-table">
                    <thead>
                        <tr>
                            <th width="10%"></th>
                            <th width="40%">Товар</th>
                            <th width="10%">Розмір</th>
                            <th width="15%">Ціна</th>
                            <th width="10%">Кількість</th>
                            <th width="15%">Сума</th>
                        </tr>
                    </thead>
                    <tbody>
                      @foreach($order->products as $product)
                        <tr>
                          <td width="10%">
                              <img width="100px" width="100px" class="image" src="{{ $product->img }}"> 
                          </td>
                          <td width="40%">{{ $product->title }}</td>
                          <td width="10%">{{ $product->size_title }}</td>
                          <td width="15%">{{ $product->price }}</td>
                          <td width="10%">{{ $product->qty }}</td>
                          <td width="15%">{{ $product->price * $product->qty }}</td>
                        </tr>
                      @endforeach
                    </tbody>
                </table>
                <hr>
                <table width="100%" class="sum-order-table">
                    <tr>
                        <td width="85%" class="head">Ціна товару (-ів)</td>
                        <td class="info">{{ $order->total_price }}</td>
                    </tr>
                    <tr>
                        <td class="head">Доставка</td>
                        <td class="info">{{ $order->delivery_company->price }}</td>
                    </tr>
                    <tr>
                        <td class="head">Загальна сума</td>
                        <td class="info">{{ $order->total_price + $order->delivery_company->price }}</td>
                    </tr>
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