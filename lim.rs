use num_format::{Locale, ToFormattedString, WriteFormatted};
use std::fmt;

struct Country<'a> {
    name: &'a str,
    population: i32,
}

const COUNTRIES: &[Country] = &[
    Country { name: "China", population: 1_412_600_000 },
    Country { name: "India", population: 1_375_586_000 },
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
