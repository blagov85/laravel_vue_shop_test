<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    use HasFactory;

    protected $table = 'regions';
    protected $guarded = false;

    public function products(){
        return $this->hasMany(User::class, 'region_id', 'id');
    }

    public function orders(){
        return $this->hasMany(Order::class, 'region_id', 'id');
    }
}
