Country = Struct.new(:name, :population)

COUNTRIES = [
  Country.new("China", 1_412_600_000),
  Country.new("India", 1_375_586_000),
  Country.new("United States", 333_299_945),
  Country.new("Indonesia", 275_773_800),
  Country.new("Pakistan", 235_825_000),
  Country.new("Nigeria", 218_541_000),
  Country.new("Brazil", 215_424_390),
  Country.new("Bangladesh", 165_158_616),
  Country.new("Russia", 145_100_000),
  Country.new("Mexico", 128_533_664),
]

def main
  total = 0
  for country in COUNTRIES
    puts("#{country.name} #{format_int(country.population)}")
    total += country.population
  end
  puts("total #{format_int(total)}")
end

def format_int(n)
  n.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse # [1]
end

main

# [1] From https://stackoverflow.com/a/6459020/2748187
