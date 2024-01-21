<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePastryRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => ['string', 'nullable'],
            'type' => ['string', 'nullable'],
            'award_winning' => ['boolean', 'nullable'],
        ];
    }
}
