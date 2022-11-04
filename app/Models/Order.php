<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';
    protected $guarded = false;

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function payment(){
        return $this->belongsTo(Payment::class, 'payment_id', 'id');
    }

    public function status(){
        return $this->belongsTo(OrderStatus::class, 'status_id', 'id');
    }

    public function delivery_company(){
        return $this->belongsTo(DeliveryCompany::class, 'delivery_company_id', 'id');
    }

    public function region(){
        return $this->belongsTo(Region::class, 'region_id', 'id');
    }

    public function getDateCreateAttribute(){
        return Carbon::parse($this->created_at)->format('d.m.Y');
    }
}
