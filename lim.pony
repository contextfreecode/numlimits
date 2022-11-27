class Country
  let name: String
  let population: I32

  new create(name': String, population': I32) =>
    name = name'
    population = population'

actor Main
  let countries: Array[Country] = [
    Country("China", 1_412_600_000)
  ]

  fun main(env: Env) ? =>
    env.out.print(countries(0)?.name)

  new create(env: Env) =>
    try
      main(env)?
    else
      env.out.print("Failed!")
    end
