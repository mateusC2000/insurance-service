policy = Policy.new(number: '3003110007872', emission_date: Date.parse('2024-03-17'),
                          coverage_end_date: Date.parse('2026-03-17'))
policy.vehicle = Vehicle.new(brand: 'McLaren', model: '765LT', year: '2020', plate: 'JOY-4213')
policy.insured = Insured.new(name: 'Darth Vader', cpf: '206.596.120-11')
policy.save!

puts("Preenche d, id: #{policy.id}")