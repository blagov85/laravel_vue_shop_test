<?php

namespace App\Models;

use App\Models\Tag;
use App\Models\User;
use App\Models\Color;
use App\Models\Feedback;
use App\Models\ProductSize;
use App\Models\ProductImage;
use App\Models\Traits\Filterable;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;
    use SoftDeletes;
    use Filterable;

    protected $table = 'products';
    protected $guarded = false;
    protected $withCount = ['likedUsers'];

    const DEFAULT_KEY = "DEFAULT_KEY";
    const PRICE_ASC_KEY = "PRICE_ASC_KEY";
    const PRICE_DESC_KEY = "PRICE_DESC_KEY";

    public function category(){
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function brand(){
        return $this->belongsTo(Brand::class, 'brand_id', 'id');
    }

    public function sex(){
        return $this->belongsTo(Sex::class, 'sex_id', 'id');
    }

    public function country(){
        return $this->belongsTo(Country::class, 'country_id', 'id');
    }

    public function materials(){
        return $this->belongsToMany(Material::class, 'material_products', 'product_id', 'material_id')
            ->withPivot('percent')->withTimestamps();
    }

    public function seasons(){
        return $this->belongsToMany(Season::class, 'product_seasons', 'product_id', 'season_id');
    }

    public function group(){
        return $this->belongsTo(Group::class, 'group_id', 'id');
    }

    public function tags(){
        return $this->belongsToMany(Tag::class, 'product_tags', 'product_id', 'tag_id');
    }

    public function colors(){
        return $this->belongsToMany(Color::class, 'color_products', 'product_id', 'color_id');
    }

    public function countProductsSizes(){
        return $this->belongsToMany(Size::class, 'product_sizes', 'product_id', 'size_id')
            ->withPivot('count')->withTimestamps()->orderBy('size_id', 'asc');
    }
    

    public function getImageUrlAttribute(){
        return url("storage/" . $this->preview_image);
    }

    public function productImages(){
        return $this->hasMany(ProductImage::class, 'product_id', 'id');
    }

    public function likedUsers(){
        return $this->belongsToMany(User::class, 'product_user_likes', 'product_id', 'user_id');
    }

    public function feedback(){
        return $this->hasMany(Feedback::class, 'product_id', 'id')->whereNull('parent_id')->where('status','active');
    }

    static public function percentMaterialsFunc(){
        $percent = [];
        for ($i = 1; $i <= 100; $i++){
            if($i <= 50){
                array_push($percent, $i, $i);
            }else{
                array_push($percent, $i);
            }
        }
        return $percent;
    }
}
