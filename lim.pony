use "format"

class Country
  let name: String
  let population: I32

  new create(name': String, population': I32) =>
    name = name'
    population = population'

actor Main
  let countries: Array[Country] = [
    Country("China", 1_412_600_000)
    Country("India", 1_375_586_000)
    Country("United States", 333_299_945)
    Country("Indonesia", 275_773_800)
    Country("Pakistan", 235_825_000)
    Country("Nigeria", 218_541_000)
    Country("Brazil", 215_424_390)
    Country("Bangladesh", 165_158_616)
    Country("Russia", 145_100_000)
    Country("Mexico", 128_533_664)
  ]

  fun main(env: Env) =>
    var total: I32 = 0
    for country in countries.values() do
      env.out.print(country.name + " " + Format.int[I32](country.population))
      total = total + country.population
    end
    env.out.print("total " + Format.int[I32](total))

  new create(env: Env) =>
    // try
    main(env)
    // else
    //   env.out.print("Failed!")
    // end
