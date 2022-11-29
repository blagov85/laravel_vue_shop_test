@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Продукты</h1>
            </div><!-- /.col -->
            <div class="col-sm-12">
                <ol class="breadcrumb float-sm-right">
                  <form action="{{ route('product.index') }}" method="GET" class="d-flex flex-row flex-wrap">
                      <!-- @csrf   -->
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="brand_id" class="form-control select2">
                            <option selected="selected" value="">Бренд</option>
                            @if(empty($data['brand_id']))
                              @foreach($brands as $brand)
                                <option value="{{ $brand->id }}">{{ $brand->title }}</option>
                              @endforeach
                            @else
                              @foreach($brands as $brand)
                                <option {{ $data['brand_id'] == $brand->id ? ' selected' : '' }} value="{{ $brand->id }}">{{ $brand->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('brand_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="category_id" class="form-control select2">
                            <option selected="selected" value="">Категория</option>
                            @if(empty($data['category_id']))
                              @foreach($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->title }}</option>
                              @endforeach
                            @else
                              @foreach($categories as $category)
                                <option {{ $data['category_id'] == $category->id ? ' selected' : '' }} value="{{ $category->id }}">{{ $category->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('category_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="sex_id" class="form-control select2">
                            <option selected="selected" value="">Пол</option>
                            @if(empty($data['sex_id']))
                              @foreach($sex as $sexOne)
                                <option value="{{ $sexOne->id }}">{{ $sexOne->title }}</option>
                              @endforeach
                            @else
                              @foreach($sex as $sexOne)
                                <option {{ $data['sex_id'] == $sexOne->id ? ' selected' : '' }} value="{{ $sexOne->id }}">{{ $sexOne->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('sex_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="color_id" class="form-control select2">
                            <option selected="selected" value="">Цвет</option>
                            @if(empty($data['color_id']))
                              @foreach($colors as $color)
                                <option value="{{ $color->id }}">{{ $color->title }}</option>
                              @endforeach
                            @else
                              @foreach($colors as $color)
                                <option {{ $data['color_id'] == $color->id ? ' selected' : '' }} value="{{ $color->id }}">{{ $color->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('color_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div>  
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="size_id" class="form-control select2">
                            <option selected="selected" value="">Размер</option>
                            @if(empty($data['size_id']))
                              @foreach($sizes as $size)
                                <option value="{{ $size->id }}">{{ $size->title }}</option>
                              @endforeach
                            @else
                              @foreach($sizes as $size)
                                <option {{ $data['size_id'] == $size->id ? ' selected' : '' }} value="{{ $size->id }}">{{ $size->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('size_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="season_id" class="form-control select2">
                            <option selected="selected" value="">Сезон</option>
                            @if(empty($data['season_id']))
                              @foreach($seasons as $season)
                                <option value="{{ $season->id }}">{{ $season->title }}</option>
                              @endforeach
                            @else
                              @foreach($seasons as $season)
                                <option {{ $data['season_id'] == $season->id ? ' selected' : '' }} value="{{ $season->id }}">{{ $season->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('season_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="material_id" class="form-control select2">
                            <option selected="selected" value="">Материал</option>
                            @if(empty($data['material_id']))
                              @foreach($materials as $material)
                                <option value="{{ $material->id }}">{{ $material->title }}</option>
                              @endforeach
                            @else
                              @foreach($materials as $material)
                                <option {{ $data['material_id'] == $material->id ? ' selected' : '' }} value="{{ $material->id }}">{{ $material->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('material_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="country_id" class="form-control select2">
                            <option selected="selected" value="">Размер</option>
                            @if(empty($data['country_id']))
                              @foreach($countries as $country)
                                <option value="{{ $country->id }}">{{ $country->title }}</option>
                              @endforeach
                            @else
                              @foreach($countries as $country)
                                <option {{ $data['country_id'] == $country->id ? ' selected' : '' }} value="{{ $country->id }}">{{ $country->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('country_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="padding-right:5px">
                        <div class="form-group">
                          <select name="tag_id" class="form-control select2">
                            <option selected="selected" value="">Тег</option>
                            @if(empty($data['tag_id']))
                              @foreach($tags as $tag)
                                <option value="{{ $tag->id }}">{{ $tag->title }}</option>
                              @endforeach
                            @else
                              @foreach($tags as $tag)
                                <option {{ $data['tag_id'] == $tag->id ? ' selected' : '' }} value="{{ $tag->id }}">{{ $tag->title }}</option>
                              @endforeach
                            @endif
                          </select>
                          @error('tag_id')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div> 
                      </li>
                      <li style="width:100px;padding-right:5px">
                        <div class="form-group">
                          <div class="input-group">
                            <input type="number" step="0.01" class="form-control" name="price_from" value="{{ !empty($data['price_from']) ? $data['price_from'] : '' }}">
                          </div>
                          @error('price_from')
                          <div class="text-danger">{{ $message }}</div>
                          @enderror
                        </div>
                      </li>
                      <li>
                        <div class="form-group" style="width:100px;padding-right:5px">
                          <div class="input-group">
                            <input type="number" step="0.01" class="form-control" name="price_to" value="{{ !empty($data['price_to']) ? $data['price_to'] : '' }}">
                          </div>
                          @error('price_to')
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
        {{ $products->withQueryString()->links() }}
        </section>
        <!-- /.content -->
@endsection