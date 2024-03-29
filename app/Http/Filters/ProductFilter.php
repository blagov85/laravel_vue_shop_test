<?php

namespace App\Http\Filters;

use Illuminate\Database\Eloquent\Builder;
use App\Http\Filters\AbstractFilter;

class ProductFilter extends AbstractFilter{

    const CATEGORIES = 'category_id';
    const BRANDS = 'brand_id';
    const SEX = 'sex_id';
    const SIZES = 'size_id';
    const COUNTRIES = 'country_id';
    const SEASONS = 'season_id';
    const MATERIALS = 'material_id';
    const COLORS = 'color_id';
    const TAGS = 'tag_id';
    const PRICE_FROM = 'price_from';
    const PRICE_TO = 'price_to';

    protected function getCallbacks(): array{
        return [
            self::CATEGORIES => [$this, 'categories'],
            self::BRANDS => [$this, 'brands'],
            self::SEX => [$this, 'sex'],
            self::SIZES => [$this, 'sizes'],
            self::COUNTRIES => [$this, 'countries'],
            self::SEASONS => [$this, 'seasons'],
            self::MATERIALS => [$this, 'materials'],
            self::COLORS => [$this, 'colors'], 
            self::TAGS => [$this, 'tags'],
            self::PRICE_FROM => [$this, 'priceFrom'],
            self::PRICE_TO => [$this, 'priceTo']
        ];
    }

    protected function categories(Builder $builder, $value){
        $builder->where('category_id', $value);
    }

    protected function brands(Builder $builder, $value){
        $builder->where('brand_id', $value);
    }

    protected function sex(Builder $builder, $value){
        $builder->where('sex_id', $value);
    }

    protected function countries(Builder $builder, $value){
        $builder->where('country_id', $value);
    }

    protected function sizes(Builder $builder, $value){
        $builder->whereHas('countProductsSizes', function ($b) use ($value){
            $b->where('size_id', $value);
        });
    }

    protected function seasons(Builder $builder, $value){
        $builder->whereHas('seasons', function ($b) use ($value){
            $b->where('season_id', $value);
        });
    }

    protected function materials(Builder $builder, $value){
        $builder->whereHas('materials', function ($b) use ($value){
            $b->where('material_id', $value);
        });
    }

    protected function colors(Builder $builder, $value){
        $builder->whereHas('colors', function ($b) use ($value){
            $b->where('color_id', $value);
        });
    }

    protected function tags(Builder $builder, $value){
        $builder->whereHas('tags', function ($b) use ($value){
            $b->where('tag_id', $value);
        });
    }

    protected function priceFrom(Builder $builder, $value){
        $builder->where('price', '>=', $value);
    }

    protected function priceTo(Builder $builder, $value){
        $builder->where('price', '<=', $value);
    }
}