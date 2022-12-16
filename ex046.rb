hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1.equal? hash2
  puts "These hashes are the same!"
elsif hash1 == hash2
  puts "These hashes are not in the same memory, but have the same content."
else
  puts "These hashes are not the same at all!"
end
