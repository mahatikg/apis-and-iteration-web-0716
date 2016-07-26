require 'rest-client'
require 'pry'
require 'JSON'

def get_character_movies_from_api(character)
  #make the web request
  all_the_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_the_characters)
  # iterate ove the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  urls_of_films = []
  character_hash["results"].each do |character_profile|
    if character_profile["name"].downcase == character
      urls_of_films = character_profile["films"]  # returns and array of strings
    end
  end
  film_array = []
  urls_of_films.each do |film_url|
    film = RestClient.get(film_url)
    film_array << JSON.parse(film)

  end
  #print film_array
  film_array
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  list_of_movies =[]
  films_hash.each do |movie_hash|
    list_of_movies << movie_hash["title"]
  end
  print list_of_movies
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
