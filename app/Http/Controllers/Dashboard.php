<?php

namespace App\Http\Controllers;

use App\Enums\UserRole;
use App\Models\User;
use Illuminate\Http\Request;

class Dashboard extends Controller
{
    public function __invoke() {

        $data = User::all()->pluck('role')->map(fn(UserRole $role) => $role->value)->countBy()->toArray();

        $chartjs = app()->chartjs
            ->name('pieChartTest')
            ->type('pie')
            ->size(['width' => 400, 'height' => 200])
            ->labels(array_keys($data))
            ->datasets([
                [
                    'backgroundColor' => ['#FF6384', '#36A2EB'],
                    'hoverBackgroundColor' => ['#FF6384', '#36A2EB'],
                    'data' => array_values($data)
                ]
            ])
            ->options([]);

        return view('dashboard', compact('chartjs'));
    }
}
