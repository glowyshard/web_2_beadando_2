<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreatePastryRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => ['string', 'required'],
            'type' => ['string', 'required'],
            'award_winning' => ['boolean', 'required'],
        ];
    }
}
