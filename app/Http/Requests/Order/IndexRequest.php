<?php

namespace App\Http\Requests\Order;

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
            'region_id' => 'nullable|integer',
            'status_id' => 'nullable|integer',
            'payment_id' => 'nullable|integer',
            'delivery_company_id' => 'nullable|integer',
            'date_from' => 'nullable|date_format:d/m/Y',
            'date_to' => 'nullable|date_format:d/m/Y',
            'page' => 'nullable|integer'
        ];
    }
}