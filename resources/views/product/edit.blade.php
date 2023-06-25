@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Редагувати товар</h1>
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
            <form action="{{ route('product.update', $product->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                  @method('patch')
                <div class="form-group">
                    <input type="text" class="form-control" name="title" value="{{ $product->title }}" placeholder="Назва товару"/>
                    @error('title')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="description" value="{{ $product->description }}" placeholder="Опис"/>
                    @error('description')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group h-20">
                  <textarea id="summernote" name="content" class="form-control">{{ $product->content }}</textarea>  
                    @error('content')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="price" value="{{ $product->price }}" placeholder="Вартість"/>
                    @error('price')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="old_price" value="{{ $product->old_price }}" placeholder="Стара вартість"/>
                    @error('old_price')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <p>Кількість на складі<p>
                <div class="d-flex justify-content-between">
                  @foreach($sizes as $size)
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="size_ids[]" value="{{ $size->id }}"/>
                        @if (isset($sizesCount[$size->title]) && ($sizesCount[$size->title] > 0))
                          <input type="number" class="form-control" name="counts[]" value="{{ $sizesCount[$size->title] }}" 
                            style="width:70px" placeholder="{{ $size->title }}"/>
                        @else
                          <input type="number" class="form-control" name="counts[]" value="" 
                            style="width:70px" placeholder="{{ $size->title }}"/>
                        @endif
                        @error('count')
                        <div class="text-danger">{{ $message }}</div>
                        @enderror
                    </div>
                  @endforeach
                </div>
                <!--main image-->
                <div class="col-md-12 mb-2">
                @if($product->preview_image)  
                  <div class="mb-2">
                    <img id="preview_image" style="max-height: 250px; border:1px solid black" 
                      src="{{ asset('storage/'.$product->preview_image) }}" alt="preview_image">
                  </div>
                @else
                  <div class="mb-2">
                    <img id="preview_image" src="{{ asset('images/no-image.png') }}"
                      alt="preview image" style="max-height: 250px; border:1px solid black"/>
                  </div>
                @endif
                    </div>
                <div class="form-group">
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="preview_image" class="custom-file-input" id="select_preview_image">
                        <label class="custom-file-label" for="select_preview_image">Выберіть файл</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Завантажити</span>
                      </div>
                    </div>
                </div>
                    @error('preview_image')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                <!--imgs product-->
                @php
                  $i = 0;
                @endphp
                @foreach($product->productImages as $i => $image)
                <input type="hidden" name="hidden" value="{{ $i++ }}">
                <input type="hidden" name="image_in_base[]" value="{{ $image->file_path }}">
                <div class="col-md-12 mb-2">
                  <img id="product_image_{{ $i }}" src="{{ asset('storage/'.$image->file_path) }}"
                      alt="preview image {{ $i }}" style="max-height: 150px; border:1px solid black">
                </div>
                <div>
                  <input type="checkbox" name="image_delete[{{ $i-1 }}]" id="delete-text-{{ $i }}"/>
                  <label for="delete-text-{{ $i }}">Видалити</label>
                </div>
                <div class="form-group">
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="product_images[]" class="custom-file-input" id="select_product_image_{{ $i }}">
                        <label class="custom-file-label" for="select_product_image_{{ $i }}">Выберіть файл</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Завантажити</span>
                      </div>
                    </div>
                  </div>
                @endforeach
                @for($i=$i+1; $i<=3; $i++)
                <div class="col-md-12 mb-2">
                  <img id="product_image_{{ $i }}" src="{{ asset('images/no-image.png') }}"
                      alt="preview image {{ $i }}" style="max-height: 150px; border:1px solid black">
                </div>
                <div>
                  <input type="checkbox" name="image_delete[{{ $i-1 }}]" id="delete-text-{{ $i }}"/>
                  <label for="delete-text-{{ $i }}">Видалити</label>
                </div>
                <div class="form-group">
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" name="product_images[]" class="custom-file-input" id="select_product_image_{{ $i }}">
                        <label class="custom-file-label" for="select_product_image_{{ $i }}">Выберіть файл</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Завантажити</span>
                      </div>
                    </div>
                  </div>
                @endfor
                <!--others-->
                <div class="form-group">
                  <select name="category_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть категорію</option>
                    @foreach($categories as $category)
                    <option {{ $product->category_id == $category->id ? ' selected' : '' }} value="{{ $category->id }}">{{ $category->title }}</option>
                    @endforeach
                  </select>
                    @error('category_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="brand_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть бренд</option>
                    @foreach($brands as $brand)
                    <option {{ $product->brand_id == $brand->id ? ' selected' : '' }} value="{{ $brand->id }}">{{ $brand->title }}</option>
                    @endforeach
                  </select>
                    @error('brand_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="sex_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть стать</option>
                    @foreach($sex as $sexOne)
                    <option {{ $product->sex_id == $sexOne->id ? ' selected' : '' }} value="{{ $sexOne->id }}">{{ $sexOne->title }}</option>
                    @endforeach
                  </select>
                    @error('sex_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="country_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть країну</option>
                    @foreach($countries as $country)
                    <option {{ $product->country_id == $country->id ? ' selected' : '' }} value="{{ $country->id }}">{{ $country->title }}</option>
                    @endforeach
                  </select>
                    @error('country_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  @if( old('materials') )
                  @php $arrayMateials = old('materials') @endphp
                  @else
                  @php $arrayMaterials = $product->materials->pluck('id')->toArray() @endphp
                  @endif
                  <select name="materials[]" class="materials" multiple="multiple" data-placeholder="Выберіть матеріал" style="width: 100%;">
                    @foreach($materials as $material)
                      @unless( in_array($material->id, $arrayMaterials) )
                        <option value="{{ $material->id }}">{{ $material->title }}</option>
                      @endunless
                    @endforeach
                    @foreach($arrayMaterials as $arrayMaterial)
                      @foreach($materials as $material)
                        @if( $arrayMaterial == $material->id )
                          <option selected value="{{ $material->id }}">{{ $material->title }}</option>
                          @break
                        @endif
                      @endforeach
                    @endforeach
                  </select>
                    @error('materials')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="percent_materials[]" class="percent_materials" multiple="multiple" data-placeholder="Выберіть процент матеріала" style="width: 100%;">
                    @foreach($percent_materials as $percent_material)
                    <option value="{{ $percent_material }}">{{ $percent_material }}</option>
                    @endforeach
                    @if( old('percent_materials') )
                      @foreach(old('percent_materials') as $old_percent_material)
                      <option selected value="{{ $old_percent_material }}">{{ $old_percent_material }}</option>
                      @endforeach
                    @elseif( $product )
                      @foreach($currentPercents as $currentPercent)
                      <option selected value="{{ $currentPercent }}">{{ $currentPercent }}</option>
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
                    <option {{ is_array($product->seasons->pluck('id')->toArray()) && in_array($season->id, $product->seasons->pluck('id')->toArray()) ? ' selected' : '' }} value="{{ $season->id }}">{{ $season->title }}</option>
                    @endforeach
                  </select>
                    @error('seasons')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="group_id" class="form-control select2" style="width: 100%;">
                    <option selected="selected" disabled>Выберіть групу</option>
                    @foreach($groups as $group)
                    <option {{ $product->group_id == $group->id ? ' selected' : '' }} value="{{ $group->id }}">{{ $group->title }}</option>
                    @endforeach
                  </select>
                    @error('group_id')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="tags[]" class="tags" multiple="multiple" data-placeholder="Выберіть тег" style="width: 100%;">
                    @foreach($tags as $tag)
                    <option {{ is_array($product->tags->pluck('id')->toArray()) && in_array($tag->id, $product->tags->pluck('id')->toArray()) ? ' selected' : '' }} value="{{ $tag->id }}">{{ $tag->title }}</option>
                    @endforeach
                  </select>
                    @error('tags')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                  <select name="colors[]" class="colors" multiple="multiple" data-placeholder="Выберіть колір" style="width: 100%;">
                    @foreach($colors as $color)
                    <option {{ is_array($product->colors->pluck('id')->toArray()) && in_array($color->id, $product->colors->pluck('id')->toArray()) ? ' selected' : '' }} value="{{ $color->id }}">{{ $color->title }}</option>
                    @endforeach
                  </select>
                    @error('colors')
                    <div class="text-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Редагувати"/>
                </div>
            </form>
            @error('product_update_error')
              <div class="text-danger">{{ $message }}</div>
            @enderror
            </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection