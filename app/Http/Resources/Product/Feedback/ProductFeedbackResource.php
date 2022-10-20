<?php

namespace App\Http\Resources\Product\Feedback;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Product\Feedback\ProductReplyFeedbackResource;

class ProductFeedbackResource extends JsonResource
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
            'message' => $this->message,
            'rating' => $this->rating,
            'parent_id' => $this->parent_id,
            'status' => $this->status,
            'user' => $this->user->name .' '. $this->user->surname,
            'date' => $this->dateCreate(),
            'reply' => ProductReplyFeedbackResource::collection($this->reply)
        ];
    }
}
