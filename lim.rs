use num_format::{Locale, ToFormattedString, WriteFormatted};
use std::fmt;

struct Country<'a> {
    name: &'a str,
    population: i32,
}

const COUNTRIES: &[Country] = &[
    Country { name: "China", population: 1_412_600_000 },
    Country { name: "India", population: 1_375_586_000 },
    Country { name: "United States", population: 333_299_945 },
    Country { name: "Indonesia", population: 275_773_800 },
    Country { name: "Pakistan", population: 235_825_000 },
    Country { name: "Nigeria", population: 218_541_000 },
    Country { name: "Brazil", population: 215_424_390 },
    Country { name: "Bangladesh", population: 165_158_616 },
    Country { name: "Russia", population: 145_100_000 },
    Country { name: "Mexico", population: 128_533_664 },
];

fn main() {
    let mut total = 0;
    for country in COUNTRIES {
        println!("{} {}", country.name, IntSep(country.population));
        total += country.population;
    }
    println!("total {}", IntSep(total));
}

struct IntSep<N>(N)
where
    N: ToFormattedString;

impl<N> fmt::Display for IntSep<N>
where
    N: ToFormattedString,
{
    fn fmt(&self, mut formatter: &mut fmt::Formatter) -> fmt::Result {
        formatter.write_formatted(&self.0, &Locale::en).unwrap();
        Ok(())
    }
}

// [1] https://doc.rust-lang.org/std/#primitives
// [2] https://doc.rust-lang.org/std/primitive.u128.html
