<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ingredient extends Model
{
    protected $fillable = [
        'pastry_id', 'free_from',
    ];

    protected $hidden = [
        'created_at', 'updated_at',
    ];
}
