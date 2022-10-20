@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Отзывы</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <form action="{{ route('feedback.index') }}" method="POST"
              style="display:flex; justify-content:right; gap: 5px">
            @csrf
              <div class="form-group">
                <select name="filter" style="width:160px">
                  <option value="">Все</option>
                  <option value="feedback">Отзывы</option>
                  <option value="reply">Ответы</option>
                </select>
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Применить"/>
              </div>
            </form>
        </div><!-- /.col -->
      </div><!-- /.container-fluid -->
    </div>
        <!-- /.content-header -->
    <hr/>
        <!-- Main content -->
        <section class="content">
        <div class="container-fluid">
          <div class="row">
            <form action="{{ route('feedback.update') }}" method="POST" style="width:100%">
              @csrf
              @method('PATCH') 
            <div class="form-group" style="display:flex;justify-content:right">
              <input type="submit" class="btn btn-primary" value="Редактировать"/>
            </div>
            <div class="col-12">
            @foreach($feedbacks as $feedback)
            <div class="card">
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <tbody>
                    <tr>
                      <td style="width:20%">Продукт</td>
                      <td>
                        <a href="{{ route('product.show', $feedback->product->id) }}">
                            {{ $feedback->product->title }}
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>Отзыв</td>
                      <td>
                        @if($feedback->parent_id == null)
                          {{ $feedback->message }}
                          <br><b>Оценка: {{ $feedback->rating }}</b>
                        @else
                          {{ $feedback->parentReply->message }}
                        @endif
                      </td>
                    </tr>
                    @if($feedback->parent_id != null)
                    <tr>
                      <td>Ответ</td>
                      <td>{{ $feedback->message }}</td>
                    </tr>
                    @endif
                    <tr>
                      <td>Действие</td>
                      <td>
                        <div>
                          <input type="radio"  name="action[{{ $feedback->id }}]" value="new" id="new_id" checked/>
                          <label for="new_id">Новый</label>
                        </div>
                        <div>
                          <input type="radio"  name="action[{{ $feedback->id }}]" value="active" id="active_id"/>
                          <label for="active_id">Опубликовать</label>
                        </div>
                        <div>
                          <input type="radio"  name="action[{{ $feedback->id }}]" value="deactive" id="deactive_id"/>
                          <label for="deactive_id">Не публиковать</label>
                        </div>
                      </td>
                    </tr>
                   </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            @endforeach
            <!-- /.card -->
            </form>
          </div>
        </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
@endsection