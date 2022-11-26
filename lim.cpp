#include <locale>
#include <iostream>
#include <string>
#include <vector>

struct Country {
    std::string name;
    int population;
};

// https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population
const auto countries = std::vector<Country> {
    { "China", 1'412'600'000 },
    { "India", 1'375'586'000 },
    { "United States", 333'299'945 },
    { "Indonesia", 275'773'800 },
    { "Pakistan", 235'825'000 },
    { "Nigeria", 218'541'000 },
    { "Brazil", 215'424'390 },
    { "Bangladesh", 165'158'616 },
    { "Russia", 145'100'000 },
    { "Mexico", 128'533'664 },
};

auto main() -> int {
    std::cout.imbue(std::locale("")); // [1]
    auto total = 0;
    for (auto& country: countries) {
        std::cout << country.name << " " << country.population << "\n";
        total += country.population;
    }
    std::cout << "total " << total << "\n";
}

// [1] See https://stackoverflow.com/a/46364980/2748187
// [2] See https://en.cppreference.com/w/cpp/language/operator_arithmetic#Overflows
// [3] See https://thephd.dev/c-the-improvements-june-september-virtual-c-meeting#n2683---towards-integer-safety
