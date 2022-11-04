<?php

namespace App\Http\Resources\Order;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
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
            'products' => $this->products,
            'total_price' => $this->total_price,
            'name' => $this->name,
            'surname' => $this->surname,
            'email' => $this->email,
            'phone' => $this->phone,
            'region' => $this->region->title,
            'settlement' => $this->settlement,
            'status_id' => $this->status_id,
            'payment' => $this->payment->title,
            'delivery_company' => $this->delivery_company->title,
            'department_DC' => $this->department_DC,
            'delivery_cost' => $this->delivery_company->price,
            'date_create' => $this->dateCreate
        ];
    }
}
