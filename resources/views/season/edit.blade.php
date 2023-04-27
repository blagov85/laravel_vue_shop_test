@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Редагувати сезон</h1>
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
            <form action="{{ route('season.update', $season->id) }}" method="POST">
                @csrf
                @method('PATCH')
                <div class="form-group">
                    <input type="text" class="form-control" name="title" value="{{ $season->title }}" placeholder="Назва сезону"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Редагувати"/>
                </div>
            </form>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection