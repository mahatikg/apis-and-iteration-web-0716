require 'rest-client'
require 'pry'
require 'JSON'

def get_movie_from_api(movie, movie_attribute)
  all_the_movies = RestClient.get('http://www.swapi.co/api/films/')   #gets the movie api
  movies_hash = JSON.parse(all_the_movies)

  our_movie = {}
  movies_hash["results"].each do |each_movie|
    if each_movie["title"].downcase == movie
      our_movie = each_movie
      end
    end
    print our_movie[movie_attribute]
    return our_movie[movie_attribute] #go down the hash and find the attribute (From user input)
    #and print that key's value
end


#   def get_character_movies_from_api(character)
#   all_the_characters = RestClient.get('http://www.swapi.co/api/people/')
#   character_hash = JSON.parse(all_the_characters)
#
#   urls_of_films = []
#   character_hash["results"].each do |character_profile|
#     if character_profile["name"].downcase == character
#       urls_of_films = character_profile["films"]
#     end
#   end
#   urls_of_films
# end
#
# def add_film_urls(urls_of_films_array)
#   film_array = []
#   urls_of_films_array.each do |film_url|
#     film = RestClient.get(film_url)
#     film_array << JSON.parse(film)
#   end
#
#   film_array
# end
#
# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
#   list_of_movies =[]
#   films_hash.each do |movie_hash|
#     list_of_movies << movie_hash["title"]
#   end
#   print list_of_movies
# end

def show_character_movies(character)
  urls_of_films = get_character_movies_from_api(character)
  films_hash = add_film_urls(urls_of_films)
  parse_character_movies(films_hash)
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
