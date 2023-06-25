<?php

namespace App\Http\Controllers\Size;

use App\Models\Size;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Size $size){
        $this->authorize('size-delete-policy', [Size::class]);
        $size->delete();
        return redirect()->route('size.index');
    }
}
