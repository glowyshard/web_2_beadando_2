<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <p class="mb-12">
                        {{ __("You're logged in!") }}
                    </p>
                    <h2 class="text-xl">The distribution of users in the database:</h2>
                    <div class="my-12">
                        {!! $chartjs->render()  !!}
                    </div>
                    <div>
                        <h2 class="text-xl font-bold mb-6">JS form:</h2>
                        <form action="" class="flex flex-col">
                            <label for="name">Name:</label>
                            <input type="text" name="name" id="name" class="mb-5">
                            <label for="unit">Unit:</label>
                            <select name="unit" id="unit" class="mb-5">
                                <option value="">Please choose...</option>
                                @foreach(\App\Models\Price::all()->pluck('unit')->unique() as $unit)
                                    <option value="{{ $unit }}"> {{ $unit }}</option>
                                @endforeach
                            </select>
                            {{--<label for="type">Type:</label>
                            <select name="type" id="type"  class="mb-6">
                                @foreach(\App\Models\Pastry::all()->pluck('type')->unique() as $type)
                                    <option value="{{ $type }}"> {{ $type }}</option>
                                @endforeach
                            </select>--}}
                            <label for="type">Ingredient:</label>
                            <select name="ingredient" id="ingredient" class="mb-6">
                                <option value="">Please choose...</option>
                                @foreach(\App\Models\Ingredient::all()->pluck('free_from')->unique() as $ingredient)
                                    <option value="{{ $ingredient }}"> {{ $ingredient }}</option>
                                @endforeach
                            </select>
                            <button type="button" id="search"
                                    class="text-white bg-blue-700 hover:bg-blue-950 hover:text-opacity-70 py-4 rounded-lg">
                                Search
                            </button>
                        </form>
                        <script>
                            class FormHandler {
                                async fetchResults() {
                                    let results = await fetch('././api/pastry');

                                    return await results.json();
                                }

                                async filterResults(name, unit, ingredient) {

                                    let all = await this.fetchResults();

                                    if (name.length > 0) {
                                        all = all.filter(pastry => pastry.name.includes(name));
                                    }

                                    if (unit) {
                                        all = all.filter(pastry => pastry.price.unit.replace(/\s+/g, "") === unit.replace(/\s+/g, ""))
                                    }

                                    if (ingredient) {
                                        all = all.filter(pastry => {
                                            let names = [];

                                            pastry.ingredients.forEach(item => {
                                                    if(item.free_from.replace(/\s+/g, "") === ingredient.replace(/\s+/g, "")) {
                                                        names.push(pastry.name);
                                                    }
                                            });
                                            return names.includes(pastry.name);
                                        })
                                    }

                                    return all;
                                }

                                createDomElements(items) {
                                    let container = document.querySelector("#js-results");
                                    container.replaceChildren();

                                    items.forEach(function (item) {
                                        let name = item.name;
                                        let unit = item.price.unit.replace(/\s+/g, "");


                                        let ingredients = [];

                                        item.ingredients.forEach(item => {
                                            ingredients.push(item.free_from.replace(/\s+/g, ""));
                                        })

                                        let ingredient_string = " - ";

                                        ingredients.forEach((name) => ingredient_string += (name + ", "));

                                        let element = document.createElement("li");
                                        element.innerText = name + " (" + unit + ")" + ingredient_string;

                                        container.appendChild(element);
                                    });
                                }
                            }

                            const formHandler = new FormHandler();

                            const searchBtn = document.querySelector("#search");

                            searchBtn.addEventListener("click", async function () {
                                let name = document.querySelector("#name").value;
                                let unit = document.querySelector("#unit").value;
                                let ingredient = document.querySelector("#ingredient").value;

                                let results = await formHandler.filterResults(name, unit, ingredient);

                                formHandler.createDomElements(results);
                            });


                        </script>
                    </div>
                    <div>
                        <h2 class="font-bold text-xl pt-12">JS Results:</h2>
                        <ul id="js-results" class="list-disc pl-5 my-12"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
