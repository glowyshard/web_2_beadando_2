<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Pastry extends Model
{
    protected $fillable = [
        'name', 'type', 'award_winning',
    ];

    protected $casts = [
        'award_winning' => 'boolean',
    ];

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    public function ingredients(): HasMany
    {
        return $this->hasMany(Ingredient::class);
    }

    public function price(): HasOne
    {
        return $this->hasOne(Price::class);
    }
}
