<?php

namespace App\Http\Controllers\Category;

use App\Models\Category;
use App\Http\Controllers\Controller;
use App\Http\Requests\Category\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('category-policy', [Category::class]);
        $data = $request->validated();
        Category::firstOrCreate($data);
        return redirect()->route('category.index');
    }
}
