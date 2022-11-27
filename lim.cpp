#include <locale>
#include <iostream>
#include <string_view>
#include <vector>

struct IntSep: std::numpunct<char> {
    auto do_thousands_sep() const -> char override { return '_'; }
    auto do_grouping() const -> std::string override { return "\3"; }
    static auto instance() -> const IntSep* {
        static IntSep instance;
        return &instance;
    }
};

struct Country {
    std::string_view name;
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
    // std::cout.imbue(std::locale(std::cout.getloc(), IntSep::instance()));
    std::cout.imbue(std::locale("")); // [6]
    auto total = 0;
    for (auto& country: countries) {
        std::cout << country.name << " " << country.population << "\n";
        total += country.population;
    }
    std::cout << "total " << total << "\n";
}

// [1] https://en.cppreference.com/w/cpp/locale/numpunct/grouping
// [2] https://en.cppreference.com/w/cpp/language/operator_arithmetic#Overflows
// [3] https://thephd.dev/c-the-improvements-june-september-virtual-c-meeting#n2683---towards-integer-safety
// [4] https://softwareengineering.stackexchange.com/q/274231
// [5] https://blog.trailofbits.com/2019/11/27/64-bits-ought-to-be-enough-for-anybody/
// [6] See https://stackoverflow.com/a/46364980/2748187
