<?php

namespace App\Http\Resources\Product;

use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Tag\TagResource;
use App\Http\Resources\Size\SizeResource;
use App\Http\Resources\Color\ColorResource;
use App\Http\Resources\Season\SeasonResource;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Category\CategoryResource;
use App\Http\Resources\Material\MaterialResource;
use App\Http\Resources\Product\ProductMinResource;
use App\Http\Resources\Product\ProductImageResource;
use App\Http\Resources\Product\Feedback\ProductFeedbackResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $products = Product::where('group_id', $this->group_id)->get();
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'content' => $this->content,
            'preview_image' => $this->preview_image,
            'image_url' => $this->imageUrl,
            'price' => $this->price,
            'old_price' => $this->old_price,
            'count' => $this->count,
            'counts' => SizeResource::collection($this->countProductsSizes),
            'is_published' => $this->is_published,
            'sex' => new CategoryResource($this->sex),
            'brand' => new CategoryResource($this->brand),
            'country' => new CategoryResource($this->country),
            'category' => new CategoryResource($this->category),
            'materials' => MaterialResource::collection($this->materials),
            'seasons' => SeasonResource::collection($this->seasons),
            'tags' => TagResource::collection($this->tags),
            'colors' => ColorResource::collection($this->colors),
            'product_images' => ProductImageResource::collection($this->productImages),
            'group_products' => ProductMinResource::collection($products),
            'like' => (Auth::user() !== null) ? $this->likedUsers->contains(Auth::user()->id) : 'false',
            'count_likes' => $this->liked_users_count,
            'feedback' => ProductFeedbackResource::collection($this->feedback),
            'rating' => round($this->feedback->avg('rating'),1),
            'count_rating' => $this->feedback->where('rating', '!=', NULL)->count(),
        ];
    }
}
