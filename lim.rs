use num_format::{Locale, ToFormattedString, WriteFormatted};
use std::fmt;

struct Country {
    name: String,
    population: i32,
}

fn main() {
    let countries: &[Country] = &[Country {
        name: "China".into(),
        population: 1_412_600_000,
    }];
    // let mut stdout = std::io::stdout();
    // let locale = &Locale::en;
    for country in countries {
        println!("{} {}", country.name, Sep(country.population));
        // stdout.write_formatted(&country.population, locale).unwrap();
        // println!();
    }
}

struct Sep<N>(N)
where
    N: ToFormattedString;

impl<N> fmt::Display for Sep<N>
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
