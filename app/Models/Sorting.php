<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sorting extends Model
{
    use HasFactory;

    protected $table = 'sortings';
    protected $guarded = false;
}
