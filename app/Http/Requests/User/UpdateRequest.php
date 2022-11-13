<?php

namespace App\Http\Requests\User;

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
            'name' => 'required|string',
            'surname' => 'nullable|string',
            'patronymic' => 'nullable|string',
            'birth_date' => 'nullable|string',
            'phone' => 'nullable|string',
            'gender' => 'nullable|integer|exists:sex,id',
            'role_id' => 'required|integer|exists:roles,id',
            'region_id' => 'nullable|integer|exists:regions,id',
            'settlement' => 'nullable|string'
        ];
    }
}
