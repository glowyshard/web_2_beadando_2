<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Price extends Model
{
    protected $fillable = [
        'pastry_id', 'price', 'unit',
    ];

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    public function pastry(): BelongsTo
    {
        return $this->belongsTo(Pastry::class);
    }
}
