<?php

namespace App\Providers;


use App\Models\Order;
use App\Models\Product;
use App\Models\Category;
use App\Models\Tag;
use App\Models\Color;
use App\Models\User;
use App\Models\Group;
use App\Models\Role;
use App\Models\Size;
use App\Policies\OrderPolicy;
use App\Policies\ProductPolicy;
use App\Policies\CategoryPolicy;
use App\Policies\TagPolicy;
use App\Policies\ColorPolicy;
use App\Policies\UserPolicy;
use App\Policies\GroupPolicy;
use App\Policies\RolePolicy;
use App\Policies\SizePolicy;
use App\Policies\DeliveryCompany;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
        Order::class => OrderPolicy::class,
        Product::class => ProductPolicy::class,
        Category::class => CategoryPolicy::class,
        Tag::class => TagPolicy::class,
        Color::class => ColorPolicy::class,
        User::class => UserPolicy::class,
        Role::class => RolePolicy::class,
        Group::class => GroupPolicy::class,
        Size::class => SizePolicy::class,
        DeliveryCompany::class => DeliveryCompanyPolicy::class
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
/*
        Gate::define('admin-panel', function(User $user){
            return $user->isAdmin();
        });

        Gate::define('writer-panel', function(User $user){
            return $user->isAdmin() || $user->isWriter();
        });

        Gate::define('manager-panel', function(User $user){
            return $user->isAdmin() || $user->isManager();
        });

        Gate::define('guest-panel', function(User $user){
            return $user->isAdmin() || $user->isGuest();
        });
        */
    }
}
