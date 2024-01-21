<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreatePastryRequest;
use App\Models\Pastry as PastryModel;
use Illuminate\Http\Response;
use Illuminate\Support\Collection;

class Pastry extends Controller
{
    public function index(): Collection
    {
        return PastryModel::with('ingredients', 'price')->get();
    }

    public function store(CreatePastryRequest $request): PastryModel
    {
        return PastryModel::create($request->validated());
    }

    public function show(string $id): PastryModel
    {
        return PastryModel::find($id);
    }

    public function update(CreatePastryRequest $request, string $id): PastryModel
    {
        PastryModel::find($id)
            ->update($request->validated());

        return PastryModel::find($id);
    }

    public function destroy(string $id): Response
    {
        PastryModel::find($id)->delete();

        return response('', 200);
    }
}
