<?php

namespace App\Http\Requests\API\User;

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
            'patronymic' => 'nullable|string',
            'surname' => 'nullable|string',
            'birth_date' => 'nullable|string',
            'gender' => 'nullable|integer',
            'phone' => 'nullable|string',
            'region_id' => 'nullable|integer',
            'settlement' => 'nullable|string'
        ];
    }
}