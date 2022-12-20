class Cinema

  def initialize(name, location)
    @name = name
    @location = location
    @movies = []
  end

  def prints_jose
    jose+12
  end

end

cineminha = Cinema.new("mateus", "onde vc kiser")
p cineminha.prints_jose

'mateus'


