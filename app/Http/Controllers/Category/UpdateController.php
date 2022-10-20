<?php

namespace App\Http\Controllers\Category;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Category\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Category $category){
        $this->authorize('category-policy', [Category::class]);
        $data = $request->validated();
        $category->update($data);
        return view('category.show', compact('category'));
    }
}
