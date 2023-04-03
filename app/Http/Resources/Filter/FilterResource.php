<?php

namespace App\Http\Resources\Filter;

use Illuminate\Http\Resources\Json\JsonResource;

class FilterResource extends JsonResource
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
            'categories' => $this->categories,
            'brands' => $this->brands,
            'sex' => $this->sex,
            'countries' => $this->countries,
            'materials' => $this->materials,
            'seasons' => $this->seasons,
            'sizes' => $this->sizes,
            'colors' => $this->colors,
            'tags' => $this->tags,
            'price' => [
                'min' => $this->minPrice,
                'max' => $this->maxPrice
            ]
            //'sorting' => $this->sorting
        ];
    }
}
