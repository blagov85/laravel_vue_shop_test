<?php

namespace App\Http\Controllers\Sex;

use App\Models\Sex;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Sex $sex){
        $this->authorize('sex-delete-policy', [Sex::class]);
        $sex->delete();
        return redirect()->route('sex.index');
    }
}
