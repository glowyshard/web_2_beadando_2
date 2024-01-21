<x-app-layout>
    <section class="grid md:grid-cols-2 md:mt-64 md:scroll-mt-64" id="hero">
        <div class="flex items-center justify-center">
            <h1 class="text-center text-4xl md:text-[200px] md:leading-[200px] font-bold py-12">
                Welcome to our <span class="text-blue-700 underline hover:text-blue-950">pastry</span> shop!
            </h1>
        </div>
        <img
            src="https://hips.hearstapps.com/hmg-prod/images/man-dispensing-cakes-in-a-pastry-bakery-royalty-free-image-1676319170.jpg?crop=0.88889xw:1xh;center,top&resize=1200:*"
            alt="Happy pastries" class="w-full h-full max-h-[1400px] object-contain aspect-square md:p-12">
    </section>
    <section class="mt-32 md:mt-[800px] md:scroll-mt-[700px]" id="intro">
        <h2 class="text-center text-3xl md:text-8xl font-bold mb-16">
            Your pastry needs are our <u class="hover:text-blue-950 text-blue-700">mission.</u>
        </h2>
        <p class="text-xl md:text-4xl p-5 md:text-center">
            Our passion is pastry.<br>
            We bake, make, knead and dress pastries for a living,<br>
            with utmost care to their taste and appearance.
        </p>
        <div class="flex justify-center mt-32 pb-32">
            <a href="{{ "" }}"
               class="px-12 py-8 text-white bg-blue-700 font-bold text-lg hover:bg-blue-950 hover:text-opacity-70 rounded-lg">
                View our products
            </a>
        </div>
    </section>
    <section class="md:mt-96 md:pt-[500px] md:pb-[125px]" id="about-us">
        <p class="text-lg p-5 md:text-xl md:text-center text-gray-600">
            We have been in the pastry business for decades.<br>
            My mother, <span class="text-blue-700">Alice</span>, has been a baker since her late thirties, and<br>
            I've taken it upon myself to provide her service to our loyal customers.<br>
            We are a small, family owned business,<br>
            which has been serving our community since <u class="text-black">1991</u>.
        </p>
    </section>
</x-app-layout>
