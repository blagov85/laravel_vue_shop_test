<?php

namespace App\Http\Requests\Product;

use Illuminate\Foundation\Http\FormRequest;

class IndexRequest extends FormRequest
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
            'size_id' => 'nullable|integer|exists:sizes,id',
            'category_id' => 'nullable|integer|exists:categories,id',
            'brand_id' => 'nullable|integer|exists:brands,id',
            'sex_id' => 'nullable|integer|exists:sex,id',
            'material_id' => 'nullable|integer|exists:materials,id',
            'season_id' => 'nullable|integer|exists:seasons,id',
            'country_id' => 'nullable|integer|exists:countries,id',
            'tag_id' => 'nullable|integer|exists:tags,id',
            'color_id' => 'nullable|integer|exists:colors,id',
            'price_from' => 'nullable|numeric',
            'price_to' => 'nullable|numeric',
            'page' => 'nullable|integer'
        ];
    }
}