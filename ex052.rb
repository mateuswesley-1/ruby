class Cinema

  attr_accessor :name, :location
  @@all = []

  def initialize(name, location)
    @name = name
    @location = location
    @movies = []
  end

  def add_movie(movie)
    # Adcionamos o objeto da classe Movie a nossa
    # variavel de instancia
    # e adcionamos a instancia da Classe cinema a uma variavel de instancia de Movie, movie.cinema, que foi criada aatraves do accessor.
    @movies << movie
    movie.cinema = self
  end

end

class Movie
  attr_accessor :title, :showtime, :cinema

  @@all = []

  def initialize(title, showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end
end


