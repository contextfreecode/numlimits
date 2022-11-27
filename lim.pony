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
      env.out.print(country.name + " " + format_int[I32](country.population))
      total = total + country.population
    end
    env.out.print("total " + format_int[I32](total))

  new create(env: Env) =>
    // try
    main(env)
    // else
    //   env.out.print("Failed!")
    // end

  fun format_int[N: (IntLike & Integer[N])](n: N): String iso^ =>
    let result = String.create()
    var count: I32 = 0
    for rune in Format.int[N](n).reverse().runes() do
      if ((count % 3) == 0) and (count > 0) then
        result.push(',')
      end
      result.push_utf32(rune)
      count = count + 1
    end
    result.reverse()

type IntLike is (
  I8 val | I16 val | I32 val | I64 val | I128 val | ILong val | ISize val |
  U8 val | U16 val | U32 val | U64 val | U128 val | ULong val | USize val
)
