<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'users';
    protected $guarded = false;

    const GENDER_NO = NULL;
    const GENDER_MALE = 1;
    const GENDER_FEMALE = 2;

    const ROLE_ADMIN = 1;
    const ROLE_WRITER = 2;
    const ROLE_GUEST = 3;
    const ROLE_MANAGER = 4;

    static function getGenders(){
        return [
            self::GENDER_NO => '',
            self::GENDER_MALE => 'Мужской',
            self::GENDER_FEMALE => 'Женский'
        ];
    }

    public function getGenderTitleAttribute(){
        return self::getGenders()[$this->gender];
    }

    public function role(){
        return $this->belongsTo(Role::class, 'role_id', 'id');
    }

    public function likedProducts(){
        return $this->belongsToMany(Product::class, 'product_user_likes', 'user_id', 'product_id');
    }

    public function feedback(){
        return $this->hasMany(Feedback::class, 'user_id', 'id');
    }

    public function region(){
        return $this->belongsTo(Region::class, 'region_id', 'id');
    }

    public function isAdmin(){
        return $this->role_id === self::ROLE_ADMIN;
    }

    public function isWriter(){
        return $this->role_id === self::ROLE_WRITER;
    }

    public function isGuest(){
        return $this->role_id === self::ROLE_GUEST;
    }

    public function isManager(){
        return $this->role_id === self::ROLE_MANAGER;
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    /*protected $fillable = [
        'name',
        'email',
        'password',
    ];
*/
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
