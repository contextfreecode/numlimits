use num_format::{Locale, WriteFormatted};

struct Country {
    name: String,
    population: i32,
}

fn main() {
    let countries: &[Country] = &[
        Country {name: "China".into(), population: 5},
    ];    
    let mut stdout = std::io::stdout();
    let locale = &Locale::en;
    for country in countries {
        print!("{} ", country.name);
        stdout.write_formatted(&country.population, locale).unwrap();
        println!();
    }
}

// [1] https://doc.rust-lang.org/std/#primitives
// [2] https://doc.rust-lang.org/std/primitive.u128.html
