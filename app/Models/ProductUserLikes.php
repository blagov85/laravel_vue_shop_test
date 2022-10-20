<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductUserLikes extends Model
{
    use HasFactory;

    protected $table = 'product_user_likes';
    protected $guarded = false;
}
