<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Увага</title>
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('adminlte/dist/css/adminlte.min.css') }}">
</head>

<body>
    <div style="
                width:300px;  
                margin: 100px auto 0; 
                color: red;
                font-size: 30px;
                ">
        {{ $message }}
        <form action="{{ $route }}" method="GET">
            <div class="form-group" style="display: flex; justify-content: center;">
                <input type="submit" class="btn btn-primary" value="{{ $redirectText }}"/>
            </div>
        </form>
    </div>
</body>