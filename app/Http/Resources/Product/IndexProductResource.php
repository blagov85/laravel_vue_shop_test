<?php

namespace App\Http\Resources\Product;

use App\Models\Product;
use App\Models\Sorting;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Color\ColorResource;
use App\Http\Resources\Season\SeasonResource;
use App\Http\Resources\Sorting\SortingResource;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Category\CategoryResource;
use App\Http\Resources\Material\MaterialResource;
use App\Http\Resources\Product\ProductMinResource;

class IndexProductResource extends JsonResource
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
            'description' => $this->description,
            'preview_image' => $this->preview_image,
            'image_url' => $this->imageUrl,
            'price' => $this->price,
            'old_price' => $this->old_price,
            'is_published' => $this->is_published,
            'sex' => new CategoryResource($this->sex),
            'brand' => new CategoryResource($this->brand),
            'country' => new CategoryResource($this->country),
            'category' => new CategoryResource($this->category),
            'materials' => MaterialResource::collection($this->materials),
            'seasons' => SeasonResource::collection($this->seasons),
            'category' => new CategoryResource($this->category),
            'colors' => ColorResource::collection($this->colors),
            'like' => (Auth::user() !== null) ? $this->likedUsers->contains(Auth::user()->id) : 'false',
            'count_likes' => $this->liked_users_count,
            'rating' => round($this->feedback->avg('rating'),1)
        ];
    }
}
