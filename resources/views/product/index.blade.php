@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Продукты</h1>
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
                <a href="{{ route('product.create') }}" class="btn btn-primary">Добавить</a>
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
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Наименование</th>
                      <th>Бренд</th>
                      <th>Пол</th>
                      <th>Сезон</th>
                      <th>Цена</th>
                      <th>Категория</th>
                      <th>Группа</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($products as $product)
                    <tr>
                      <td>{{ $product->id }}</td>
                      <td><a href="{{ route('product.show', $product->id) }}">{{ $product->title }}</a></td>
                      <td><a href="{{ route('product.show', $product->id) }}">{{ $product->brand->title }}</a></td>
                      <td><a href="{{ route('product.show', $product->id) }}">{{ $product->sex->title }}</a></td>
                      <td><a href="{{ route('product.show', $product->id) }}">
                            @foreach($product->seasons as $season )
                              {{ $season->title }}
                            @endforeach
                          </a></td>
                      <td><a href="{{ route('product.show', $product->id) }}">{{ $product->price }}</a></td>
                      <td><a href="{{ route('product.show', $product->id) }}">{{ $product->category->title }}</a></td>
                      <td>
                        @if($product->group_id)
                        <a href="{{ route('product.show', $product->id) }}">{{ $product->group->title }}</a>
                        @endif
                      </td>
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