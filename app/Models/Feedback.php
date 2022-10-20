<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Product;
use App\Models\Feedback;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Feedback extends Model
{
    use HasFactory;

    protected $table = 'feedback';
    protected $guarded = false;

    public function product(){
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function parentReply(){
        return $this->belongsTo(Feedback::class, 'parent_id', 'id');
    }


    public function reply(){
        return $this->hasMany(Feedback::class, 'parent_id', 'id');
    }

    public function dateCreate(){
        Carbon::setLocale('ru');
        return $this->created_at->isoFormat('D MMMM Y г.');
    }

    public function feedbackQuery(){
        return $this->hasOne(Feedback::class, 'parent_id', 'id');
    }
}
