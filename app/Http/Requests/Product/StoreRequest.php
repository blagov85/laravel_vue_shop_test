<?php

namespace App\Http\Requests\Product;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'title' => 'required|string',
            'description' => 'required|string',
            'content' => 'required|string',
            'price' => 'required|integer',
            'size_ids' => 'required|array',
            'size_ids.*' => 'required|integer|exists:sizes,id',
            'counts' => 'required|array',
            'counts.*' => 'nullable|integer',
            'preview_image' => 'required|file',
            'category_id' => 'required|integer|exists:categories,id',
            'brand_id' => 'required|integer|exists:brands,id',
            'sex_id' => 'required|integer|exists:sex,id',
            'materials' => 'required|array',
            'materials.*' => 'required|integer|exists:materials,id',
            'percent_materials' => 'nullable|array',
            'percent_materials.*' => 'nullable|integer',
            'seasons' => 'required|array',
            'seasons.*' => 'required|integer|exists:seasons,id',
            'country_id' => 'required|integer|exists:countries,id',
            'group_id' => 'nullable|integer|exists:groups,id',
            'tags' => 'nullable|array',
            'tags.*' => 'nullable|integer|exists:tags,id',
            'colors' => 'required|array',
            'colors.*' => 'nullable|integer|exists:colors,id',
            'product_images' => 'nullable|array',
            'product_images.*' => 'nullable|file'
        ];
    }
}