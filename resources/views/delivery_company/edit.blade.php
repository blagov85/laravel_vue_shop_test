@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Редактировать транспортную компанию</h1>
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
            <form action="{{ route('delivery_company.update', $deliveryCompany->id) }}" method="POST">
                @csrf
                @method('PATCH')
                <div class="form-group">
                    <input type="text" class="form-control" name="title" value="{{ $deliveryCompany->title }}" placeholder="Наименование"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="price" value="{{ $deliveryCompany->price }}" placeholder="Стоимость"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Редактировать"/>
                </div>
            </form>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection