@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Додати товар до замовлення #{{ $order->id }}</h1>
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
            <form action="{{ route('order.add_product.update', $order->id) }}" method="POST">
                @csrf
                @method('patch')
                <div class="form-group">
                    <input type="text" class="form-control" name="id_product" value="{{ old('id_product') }}" placeholder="id товара"/>
                </div>
                @error('id_product')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
                <div class="form-group">
                    <select name="size_id" class="form-control select2">
                        <option selected="selected" disabled>Выберіть розмір товара</option>
                        @foreach($sizes as $size)
                            <option {{ old('size_id') == $size->id ? ' selected' : '' }} value="{{ $size->id }}">{{ $size->title }}</option>
                        @endforeach
                    </select>
                </div>
                @error('size_id')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
                <div class="form-group">
                    <input type="number" class="form-control" name="count_product" value="{{ old('count_product') }}" placeholder="Кількість"/>
                </div>
                @error('count_product')
                    <div class="text-danger">{{ $message }}</div>
                @enderror  
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Додати"/>
                </div>
                @error('product_add_error')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </form>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection