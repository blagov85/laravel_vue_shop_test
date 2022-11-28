@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-12">
                  <h1 class="m-0">Заказы</h1>
              </div><!-- /.col -->
              <div class="col-sm-12">
                  <ol class="breadcrumb float-sm-right">
                    <form action="{{ route('order.index') }}" method="GET" class="d-flex flex-row flex-wrap">
                      <!-- @csrf   -->
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="region_id" class="form-control select2">
                            <option selected="selected" value="">Регион</option>
                            @if(empty($data['region_id']))
                              @foreach($regions as $region)
                                <option value="{{ $region->id }}">{{ $region->title }}</option>
                              @endforeach
                            @else
                              @foreach($regions as $region)
                                <option {{ $data['region_id'] == $region->id ? ' selected' : '' }} value="{{ $region->id }}">{{ $region->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('region_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="delivery_company_id" class="form-control select2">
                            <option selected="selected" value="">Компания доставки</option>
                            @if(empty($data['delivery_company_id']))
                              @foreach($companies as $company)
                                <option value="{{ $company->id }}">{{ $company->title }}</option>
                              @endforeach
                            @else
                              @foreach($companies as $company)
                                <option {{ $data['delivery_company_id'] == $company->id ? ' selected' : '' }} value="{{ $company->id }}">{{ $company->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('delivery_company_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="status_id" class="form-control select2">
                            <option selected="selected" value="">Статус заказа</option>
                            @if(empty($data['status_id']))
                              @foreach($statuses as $status)
                                <option value="{{ $status->id }}">{{ $status->title }}</option>
                              @endforeach
                            @else
                              @foreach($statuses as $status)
                                <option {{ $data['status_id'] == $status->id ? ' selected' : '' }} value="{{ $status->id }}">{{ $status->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('status_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div>  
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="payment_id" class="form-control select2">
                            <option selected="selected" value="">Статус оплаты</option>
                            @if(empty($data['payment_id']))
                              @foreach($payments as $payment)
                                <option value="{{ $payment->id }}">{{ $payment->title }}</option>
                              @endforeach
                            @else
                              @foreach($payments as $payment)
                                <option {{ $data['payment_id'] == $payment->id ? ' selected' : '' }} value="{{ $payment->id }}">{{ $payment->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('payment_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" name="date_from" value="{{ !empty($data['date_from']) ? $data['date_from'] : $dateFrom }}" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask>
                          </div>
                          @error('date_from')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div>
                      </li>
                      <li>
                        <div class="form-group" style="padding-right:5px">
                          <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" name="date_to" value="{{ !empty($data['date_to']) ? $data['date_to'] : $dateFrom }}" data-inputmask-alias="datetime" data-inputmask-inputformat="dd/mm/yyyy" data-mask>
                          </div>
                          @error('date_to')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div>
                      </li>
                      <input type="hidden" name="page" value="1">
                      <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Применить"/>
                      </div>
                    </form>
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
        {{ $orders->withQueryString()->links() }}
        </section>
        <!-- /.content -->
@endsection