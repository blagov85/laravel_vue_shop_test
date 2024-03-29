<?php

namespace App\Http\Requests\API\Order;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

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
            'products' => 'required|array',
            'user_id' => 'nullable|integer',
            'name' => 'required|string',
            'surname' => 'required|string',
            'email' => 'required|string',
            'phone' => 'required|string',
            'region_id' => 'required|integer',
            'settlement' => 'required|string',
            'total_price' => 'required|integer',
            'status_id' => 'required|integer',
            'payment_id' => 'required|integer',
            'delivery_company_id' => 'required|integer',
            'department_DC' => 'required|integer',
            'delivery_cost' => 'required|integer'
        ];
    }

    public function failedValidation(Validator $validator)

    {

        throw new HttpResponseException(response()->json([

            'success'   => false,

            'message'   => 'Validation errors',

            'errors'      => $validator->errors()

        ], 422));

    }
}