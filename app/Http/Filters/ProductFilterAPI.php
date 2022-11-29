<?php

namespace App\Http\Filters;

use Illuminate\Database\Eloquent\Builder;
use App\Http\Filters\AbstractFilter;

class ProductFilterAPI extends AbstractFilter{

    const CATEGORIES = 'categories';
    const BRANDS = 'brands';
    const SEX = 'sex';
    const SIZES = 'sizes';
    const COUNTRIES = 'countries';
    const SEASONS = 'seasons';
    const MATERIALS = 'materials';
    const COLORS = 'colors';
    const PRICES = 'prices';
    const TAGS = 'tags';

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
            self::PRICES => [$this, 'prices'], 
            self::TAGS => [$this, 'tags'] 
        ];
    }

    protected function categories(Builder $builder, $value){
        $builder->whereIn('category_id', $value);
    }

    protected function brands(Builder $builder, $value){
        $builder->whereIn('brand_id', $value);
    }

    protected function sex(Builder $builder, $value){
        $builder->whereIn('sex_id', $value);
    }

    protected function countries(Builder $builder, $value){
        $builder->whereIn('country_id', $value);
    }

    protected function sizes(Builder $builder, $value){
        $builder->whereHas('countProductsSizes', function ($b) use ($value){
            $b->whereIn('size_id', $value);
        });
    }

    protected function seasons(Builder $builder, $value){
        $builder->whereHas('seasons', function ($b) use ($value){
            $b->whereIn('season_id', $value);
        });
    }

    protected function materials(Builder $builder, $value){
        $builder->whereHas('materials', function ($b) use ($value){
            $b->whereIn('material_id', $value);
        });
    }

    protected function colors(Builder $builder, $value){
        $builder->whereHas('colors', function ($b) use ($value){
            $b->whereIn('color_id', $value);
        });
    }

    protected function prices(Builder $builder, $value){
        $builder->whereBetween('price', $value);
    }

    protected function tags(Builder $builder, $value){
        $builder->whereHas('tags', function ($b) use ($value){
            $b->whereIn('tag_id', $value);
        });
    }

}