require_relative "../lib/api_communicator2.rb"
require_relative "../lib/command_line_interface2.rb"

welcome
movie = get_movie_from_user
movie_attribute = get_option_from_user
get_movie_from_api(movie, movie_attribute)
