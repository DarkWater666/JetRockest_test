seed_file = File.expand_path(File.join('db', 'seeds', 'data', 'rates.yml'))
rates_data = YAML.load_file seed_file

puts 'Generating in process: some initial rates. Wait...'
rates_data.each do |rate|
  Rate.create name: rate['name'], stat: rate['stat'], value: rate['value']
end
