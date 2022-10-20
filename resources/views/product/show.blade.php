@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Показать продукт</h1>
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
              <div class="card-header d-flex p-3">
                <div class="mr-3">
                  <a href="{{ route('product.edit', $product->id) }}" class="btn btn-primary">Редактировать</a>
                </div>
                <form action="{{ route('product.delete', $product->id) }}" method="post">
                  @csrf
                  @method('delete')
                  <div class="form-group">
                    <input type="submit" class="btn btn-danger" value="Удалить"/>
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
                <table class="table table-hover text-nowrap">
                  <tbody>
                    <tr>
                      <td>ID</td>
                      <td>{{ $product->id }}</td>
                    </tr>
                    <tr>
                      <td>Наименование</td>
                      <td>{{ $product->title }}</td>
                    </tr>
                    <tr>
                      <td>Бренд</td>
                      <td>{{ $product->brand->title }}</td>
                    </tr>
                    <tr>
                    <tr>
                      <td>Пол</td>
                      <td>{{ $product->sex->title }}</td>
                    </tr>
                    <tr>
                    <tr>
                      <td>Сезон</td>
                      <td>{{ implode(', ',$seasons) }}</td>
                    </tr>
                    <tr>
                      <td>Описание</td>
                      <td>{{ $product->description }}</td>
                    </tr>
                    <tr>
                      <td>Контент</td>
                      <td>{!! $product->content !!}</td>
                    </tr>
                    <tr>
                      <td>Главное фото</td>
                      <td>
                        <div class="р-10 mb-2">
                          <img style="width:50%; height:50%;" src="{{ asset('storage/'.$product->preview_image) }}" alt="preview_image">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>Фото продукта</td>
                      <td>
                        <div style="display: flex; flex-direction: row; justify-content: space-around;">
                          @foreach($product->productImages as $image)  
                              <img style="width:30%; height:30%;" src="{{ asset('storage/'.$image->file_path) }}" alt="product_image" />
                          @endforeach
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>Материал</td>
                      <td>
                        @foreach($materialsPercent as $key=> $materialPercent)
                          <div>
                            {{ $key }} - {{ $materialPercent }}
                          </div>
                        @endforeach
                      </td>
                    </tr>
                    <tr>
                      <td>Цена</td>
                      <td>{{ $product->price }}</td>
                    </tr>
                    <tr>
                      <td>Старая цена</td>
                      <td>{{ $product->old_price }}</td>
                    </tr>
                    <tr>
                      <td>Количество на складе</td>
                      <td>
                        @foreach($sizesCount as $key=> $sizesCount)
                          <div>
                            {{ $key }} - {{ $sizesCount }}
                          </div>
                        @endforeach
                      </td>
                    </tr>
                    <tr>
                      <td>Категория</td>
                      <td>{{ $product->category->title }}</td>
                    </tr>
                    <tr>
                      <td>Страна</td>
                      <td>{{ $product->country->title }}</td>
                    </tr>
                    <tr>
                      <td>Группи</td>
                      <td>
                        @if($product->group_id)  
                        {{ $product->group->title }}
                        @endif
                      </td>
                    </tr>
                    <tr>
                      <td>Теги</td>
                      <td>{{ implode(', ',$tags) }}</td>
                    </tr>
                    <tr>
                      <td>Цвета</td>
                      <td style="display: flex">
                        @foreach($colors as $color)  
                          <div style="width: 16px; height: 16px; background: #{{ $color }}; margin-right: 5px"></div>
                        @endforeach
                      </td>
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