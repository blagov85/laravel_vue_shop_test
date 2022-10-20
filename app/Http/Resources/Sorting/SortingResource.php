<?php

namespace App\Http\Resources\Sorting;

use Illuminate\Http\Resources\Json\JsonResource;

class SortingResource extends JsonResource
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
            'title' => $this->title,
            'key_sort' => $this->key_sort
        ];
    }
}
