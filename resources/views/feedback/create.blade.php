@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Добавить продукт</h1>
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
            <div class="row ">
            <form action="{{ route('product.store') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                    <input type="text" class="form-control" name="title" value="{{ old('title') }}" placeholder="Наименование"/>
                    @error('title')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="description" value="{{ old('description') }}" placeholder="Описание"/>
                    @error('description')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group h-20">
                  <textarea id="summernote" name="content" class="form-control">{{ old('content') }}</textarea>  
                  <!--<textarea " name="content" cols="30" ></textarea>-->
                    @error('content')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                  <div class="form-group">
                      <input type="number" class="form-control" name="price" value="{{ old('price') }}" placeholder="Цена"/>
                      @error('price')
                      <div class="text-danger">{{ $message }}</div>
                      @enderror
                  </div>
                <p>Количество на складе<p>
                <div class="d-flex justify-content-between">
                  @foreach($sizes as $key => $size)
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="size_ids[]" value="{{ $size->id }}"/>
                        <input type="number" class="form-control" name="counts[]" value="{{ old('counts.'.$key) }}" 
                          style="width:70px" placeholder="{{ $size->title }}"/>
                    </div>
                  @endforeach
                  @error('counts')
                    <div class="text-danger">{{ $message }}</div>
                  @enderror
                </div>
                <!--img preview-->
                <div class="col-md-12 mb-2">
                  <img id="preview_image" src="https://www.daveraine.com/img/products/no-image.jpg"
                      alt="preview image" style="max-height: 250px;">
                </div>
                <div class="form-group">
                  <div class="input-group">
                    <div class="custom-file">
                      <input type="file" name="preview_image" class="custom-file-input" id="select_preview_image">
                      <label class="custom-file-label" for="select_preview_image">Выберите файл</label>
                    </div>
                    <div class="input-group-append">
                      <span class="input-group-text">Загрузить</span>
                    </div>
                  </div>
                  @error('preview_image')
                    <div class="text-danger">{{ $message }}</div>
                  @enderror
                </div>
                    
                <!--imgs product-->
                <div class="col-md-12 mb-2">
                  <img id="product_image_1" src="https://www.daveraine.com/img/products/no-image.jpg"
                      alt="preview image 1" style="max-height: 150px;">
                </div>
                <div class="form-group">
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="product_images[]" class="custom-file-input" id="select_product_image_1">
                        <label class="custom-file-label" for="select_product_image_1">Выберите файл</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Загрузить</span>
                      </div>
                    </div>
                  </div>
                <div class="col-md-12 mb-2">
                  <img id="product_image_2" src="https://www.daveraine.com/img/products/no-image.jpg"
                      alt="preview image 2" style="max-height: 150px;">
                </div>
                <div class="form-group">
                    <img src>  
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="product_images[]" class="custom-file-input" id="select_product_image_2">
                        <label class="custom-file-label" for="exampleInputFile">Выберите файл</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Загрузить</span>
                      </div>
                    </div>
                  </div>
                <div class="col-md-12 mb-2">
                  <img id="product_image_3" src="https://www.daveraine.com/img/products/no-image.jpg"
                      alt="preview image 3" style="max-height: 150px;">
                </div>
                <div class="form-group">
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="product_images[]" class="custom-file-input" id="select_product_image_3">
                        <label class="custom-file-label" for="exampleInputFile">Выберите файл</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Загрузить</span>
                      </div>
                    </div>
                </div>
                @error('product_images')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
                <!--others-->
                <div class="form-group">
                  <select name="category_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите категорию</option>
                    @foreach($categories as $category)
                    <option {{ old('category_id') == $category->id ? ' selected' : '' }} value="{{ $category->id }}">{{ $category->title }}</option>
                    @endforeach
                  </select>
                    @error('category_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="brand_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите бренд</option>
                    @foreach($brands as $brand)
                    <option {{ old('brand_id') == $brand->id ? ' selected' : '' }} value="{{ $brand->id }}">{{ $brand->title }}</option>
                    @endforeach
                  </select>
                    @error('brand_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="sex_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите пол</option>
                    @foreach($sex as $sexOne)
                    <option {{ old('sex_id') == $sexOne->id ? ' selected' : '' }} value="{{ $sexOne->id }}">{{ $sexOne->title }}</option>
                    @endforeach
                  </select>
                    @error('sex_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="country_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите страну</option>
                    @foreach($countries as $country)
                    <option {{ old('country_id') == $country->id ? ' selected' : '' }} value="{{ $country->id }}">{{ $country->title }}</option>
                    @endforeach
                  </select>
                    @error('country_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="materials[]" class="materials" multiple="multiple" data-placeholder="Выберите материал" style="width: 100%;">
                    @if( old('materials') )
                      @foreach($materials as $material)
                        @unless( in_array($material->id, old('materials')) )
                          <option value="{{ $material->id }}">{{ $material->title }}</option>
                        @endunless
                      @endforeach
                      @foreach(old('materials') as $old_material)
                        @foreach($materials as $material)
                          @if( $old_material == $material->id )
                            <option selected value="{{ $material->id }}">{{ $material->title }}</option>
                            @break
                          @endif
                        @endforeach
                      @endforeach
                    @else
                      @foreach($materials as $material)
                      <option value="{{ $material->id }}">{{ $material->title }}</option>
                      @endforeach
                    @endif
                  </select>
                    @error('materials')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="percent_materials[]" class="percent_materials" multiple="multiple" data-placeholder="Выберите процент материала" style="width: 100%;">
                    @foreach($percent_materials as $percent_material)
                    <option value="{{ $percent_material }}">{{ $percent_material }}</option>
                    @endforeach
                    @if( old('percent_materials') )
                      @foreach(old('percent_materials') as $old_percent_material)
                      <option selected value="{{ $old_percent_material }}">{{ $old_percent_material }}</option>
                      @endforeach
                    @endif
                  </select>
                    @error('percent_materials')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="seasons[]" class="seasons" multiple="multiple" data-placeholder="Выберите сезон" style="width: 100%;">
                    @foreach($seasons as $season)
                    <option {{ is_array( old('seasons')) && in_array($season->id, old('seasons')) ? ' selected' : '' }} value="{{ $season->id }}">{{ $season->title }}</option>
                    @endforeach
                  </select>
                    @error('seasons')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="group_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберите группу</option>
                    @foreach($groups as $group)
                    <option {{ old('group_id') == $group->id ? ' selected' : '' }} value="{{ $group->id }}">{{ $group->title }}</option>
                    @endforeach
                  </select>
                    @error('group_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="tags[]" class="tags" multiple="multiple" data-placeholder="Выберите тег" style="width: 100%;">
                    @foreach($tags as $tag)
                    <option {{ is_array( old('tags')) && in_array($tag->id, old('tags')) ? ' selected' : '' }} value="{{ $tag->id }}">{{ $tag->title }}</option>
                    @endforeach
                  </select>
                    @error('tags')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="colors[]" class="colors" multiple="multiple" data-placeholder="Выберите цвет" style="width: 100%">
                    @foreach($colors as $color)
                    <option {{ is_array( old('colors')) && in_array($color->id, old('colors')) ? ' selected' : '' }} value="{{ $color->id }}">{{ $color->title }}</option>
                    @endforeach
                  </select>
                    @error('colors')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Добавить"/>
                </div>
            </form>
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection