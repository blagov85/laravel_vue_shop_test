<?php

namespace App\Http\Requests\API\Order;

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
            'products' => 'nullable|array',
            'user_id' => 'nullable|integer',
            'name' => 'nullable|string',
            'surname' => 'nullable|string',
            'email' => 'nullable|string',
            'phone' => 'nullable|string',
            'region_id' => 'nullable|integer',
            'settlement' => 'nullable|string',
            'total_price' => 'nullable|integer',
            'status_id' => 'nullable|integer',
            'payment_id' => 'nullable|integer'
        ];
    }
}