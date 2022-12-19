def find_favorite(array_of_hash_objects)
  # take an array_of_hash_objects and return the hash which has the key/value
  # pair :is_my_favorite? => true. If no hash returns the value true to the key
  # :is_my_favorite? it should return nil
  array_of_hash_objects.select {|hash| hash[:is_my_favorite?] == true}[0]

  # TIP: there will only be a maximum of one hash in the array that will
  # return true to the :is_my_favorite? key
end

p find_favorite( [
  { name: 'Ruby', is_my_favorite?: true },
  { name: 'JavaScript', is_my_favorite?: false },
  { name: 'HTML', is_my_favorite?: false }
])
