contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

#symbols
symbols = [:email, :adress, :number]

=begin
minha solucao

contacts.key.each_with_index do |name, i_name|
  symbols.each_with_index do |symbol, i_symb|
    contacts[name][symbol] = contact_data[i_name][i_symb]
  end
end
=end

contacts.each_with_index do |(name, hash), i_name|
  symbols.each do |symbol|
    hash[symbol] = contact_data[i_name].shift
  end
end

p contacts

