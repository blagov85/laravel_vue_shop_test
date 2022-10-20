<?php

namespace App\Http\Resources\User;

use App\Http\Resources\User\UserBirthResource;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'email' => $this->email,
            'name' => $this->name,
            'surname' => $this->surname,
            'patronymic' => $this->patronymic,
            'age' => $this->age,
            'gender' => $this->gender,
            'birth' => new UserBirthResource($this->birthData),
            'phone' => $this->phone,
            'region_id' => $this->region_id,
            'settlement' => $this->settlement
        ];
    }
}
