<?php

namespace App\Http\Requests\Order\AddProduct;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
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
            'id_product' => 'required|string',
            'size_id' => 'required|integer',
            'count_product' => 'required|integer|min:1'
        ];
    }
}