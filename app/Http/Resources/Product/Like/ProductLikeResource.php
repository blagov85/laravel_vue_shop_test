<?php

namespace App\Http\Resources\Product\Like;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductLikeResource extends JsonResource
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
            'like' => $this->likedUsers->contains(Auth::user()->id),
            'count_likes' => $this->liked_users_count
            
        ];
    }
}
