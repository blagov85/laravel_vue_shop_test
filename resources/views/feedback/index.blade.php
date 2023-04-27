@extends('layouts.main')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Відгуки</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <form action="{{ route('feedback.index') }}" method="POST"
              style="display:flex; justify-content:right; gap: 5px">
            @csrf
              <div class="form-group">
                <select name="filter" style="width:160px">
                  <option value="">Всі</option>
                  <option value="feedback">Відгуки</option>
                  <option value="reply">Відповіді</option>
                </select>
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Застосувати"/>
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
              <input type="submit" class="btn btn-primary" value="Редагувати"/>
            </div>
            <div class="col-12">
            @foreach($feedbacks as $feedback)
            <div class="card">
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <tbody>
                    <tr>
                      <td style="width:20%">Товар</td>
                      <td>
                        <a href="{{ route('product.show', $feedback->product->id) }}">
                            {{ $feedback->product->title }}
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>Відгук</td>
                      <td>
                        @if($feedback->parent_id == null)
                          {{ $feedback->message }}
                          <br><b>Оцінка: {{ $feedback->rating }}</b>
                        @else
                          {{ $feedback->parentReply->message }}
                        @endif
                      </td>
                    </tr>
                    @if($feedback->parent_id != null)
                    <tr>
                      <td>Відповідь</td>
                      <td>{{ $feedback->message }}</td>
                    </tr>
                    @endif
                    <tr>
                      <td>Дія</td>
                      <td>
                        <div>
                          <input type="radio"  name="action[{{ $feedback->id }}]" value="new" id="new_id" checked/>
                          <label for="new_id">Новий</label>
                        </div>
                        <div>
                          <input type="radio"  name="action[{{ $feedback->id }}]" value="active" id="active_id"/>
                          <label for="active_id">Опублікувати</label>
                        </div>
                        <div>
                          <input type="radio"  name="action[{{ $feedback->id }}]" value="deactive" id="deactive_id"/>
                          <label for="deactive_id">Не публікувати</label>
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