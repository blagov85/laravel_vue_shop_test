@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Редактировать заказ</h1>
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
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <div class="header">
                    <h5>Замовлення <span>#{{ $order->id }}</span></h5>
                </div>
                <div class="header-table">Інформація про замовлення</div>
                <form action="{{ route('order.update', $order->id) }}" method="POST">
                  @csrf
                  @method('patch')
                  <table class="info-order-table">
                      <tr>
                          <td class="head">Дата</td>
                          <td>{{ $order->dateCreate }}</td>
                      </tr>
                      <tr>
                          <td class="head">Прізвище</td>
                          <td>
                            <div class="form-group">
                              <input type="text" class="form-control" name="surname" value="{{ old('surname') ?? $order->surname }}"/>
                            </div>  
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Ім'я</td>
                          <td>
                            <div class="form-group">
                              <input type="text" class="form-control" name="surname" value="{{ old('name') ?? $order->name }}"/>
                            </div>  
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Телефон</td>
                          <td>
                            <div class="form-group">
                              <div class="input-group">
                                <input type="text" class="form-control" name="phone" value="{{ old('phone') ?? $order->phone }}"
                                    data-inputmask='"mask": "+380 (99) 999-99-99"' data-mask>
                              </div>
                              <!-- /.input group -->
                            </div>  
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Email</td>
                          <td>
                            <div class="form-group">
                              <input type="email" class="form-control" value="{{ old('phone') ?? $order->email }}">
                            </div>
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Область</td>
                          <td>
                            <div class="form-group">
                              <select name="region_id" class="form-control select2">
                                <option selected="selected" disabled>Выберите регион</option>
                                @foreach($regions as $region)
                                <option {{ $order->region_id == $region->id ? ' selected' : '' }} value="{{ $region->id }}">{{ $region->title }}</option>
                                @endforeach
                              </select>
                                @error('region_id')
                                <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>  
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Місто</td>
                          <td>
                            <div class="form-group">
                              <input type="text" class="form-control" name="settlement" value="{{ old('settlement') ?? $order->settlement }}"/>
                            </div> 
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Оплата</td>
                          <td>
                            <div class="form-group">
                              <select name="payment_id" class="form-control select2">
                                <option selected="selected" disabled>Выберите статус оплаты</option>
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
                          <td class="head">Служба доставки</td>
                          <td>
                            <div class="form-group">
                              <select name="delivery_company_id" class="form-control select2">
                                <option selected="selected" disabled>Выберите компанию доставки</option>
                                @foreach($companies as $company)
                                <option {{ $order->delivery_company_id == $company->id ? ' selected' : '' }} value="{{ $company->id }}">{{ $company->title }}</option>
                                @endforeach
                              </select>
                                @error('delivery_company_id')
                                <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>  
                          </td>
                      </tr>
                      <tr>
                          <td class="head">Відділення</td>
                          <td>
                            <div class="form-group">
                              <input type="number" class="form-control" name="department_DC" value="{{ old('department_DC') ?? $order->department_DC }}"/>
                            </div>  
                          </td>
                      </tr>
                  </table>
                  <br>
                  <table class="order-table">
                      <thead>
                          <tr>
                              <th width="10%"></th>
                              <th width="30%">Товар</th>
                              <th width="10%">Розмір</th>
                              <th width="15%">Ціна</th>
                              <th width="7%">Кількість</th>
                              <th width="7%">Залишок</th>
                              <th width="15%">Сума</th>
                              <th width="6%">Видалити</th>
                          </tr>
                      </thead>
                      <tbody>
                        @foreach($order->products as $product)
                          <tr>
                            <td width="10%">
                                <img width="100px" width="100px" class="image" src="{{ $product->img }}"> 
                            </td>
                            <td width="30%">{{ $product->title }}</td>
                            <td width="10%">{{ $product->size_title }}</td>
                            <td width="15%">{{ $product->price }}</td>
                            <td width="7%">{{ $product->qty }}</td>
                            <td width="7%">{{ $product->qty }}</td>
                            <td width="15%">{{ $product->price * $product->qty }}</td>
                            <td width="6%" style="text-align:center">
                              <input type="checkbox">
                            </td>
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
                  <div class="form-group" style="margin: 20px auto; float:right;">
                    <input type="submit" class="btn btn-primary" value="Редактировать"/>
                  </div>
                </form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection