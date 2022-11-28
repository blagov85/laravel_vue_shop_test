<?php

namespace App\Http\Filters;

use Carbon\Carbon;
use App\Http\Filters\AbstractFilter;
use Illuminate\Database\Eloquent\Builder;

class OrderFilter extends AbstractFilter{

    const REGION = 'region_id';
    const STATUS = 'status_id';
    const PAYMENT = 'payment_id';
    const DELIVERY_COMPANY = 'delivery_company_id';
    const DATE_FROM = 'date_from';
    const DATE_TO = 'date_to';

    protected function getCallbacks(): array{
        return [
            self::REGION => [$this, 'region'],
            self::STATUS => [$this, 'status'],
            self::PAYMENT => [$this, 'payment'],
            self::DELIVERY_COMPANY => [$this, 'deliveryCompany'],
            self::DATE_FROM => [$this, 'dateFrom'],
            self::DATE_TO => [$this, 'dateTo']
        ];
    }

    protected function region(Builder $builder, $value){
        $builder->where('region_id', $value);
    }

    protected function status(Builder $builder, $value){
        $builder->where('status_id', $value);
    }

    protected function payment(Builder $builder, $value){
        $value = (int) $value;
        $builder->where('payment_id', $value);
    }

    protected function deliveryCompany(Builder $builder, $value){
        $builder->where('delivery_company_id', $value);
    }

    protected function dateFrom(Builder $builder, $value){
        $value = Carbon::createFromFormat('d/m/Y', $value)->format('Y-m-d');
        $builder->whereDate('created_at', '>=', $value);
    }

    protected function dateTo(Builder $builder, $value){
        $value = Carbon::createFromFormat('d/m/Y', $value)->format('Y-m-d');
        $builder->whereDate('created_at', '<=', $value);
    }
}