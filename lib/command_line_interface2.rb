def welcome
  puts "Welcome to Lucas Land!"# puts out a welcome message here!
end

def get_movie_from_user
  puts "please enter a star wars movie"
  gets.strip.downcase

  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_option_from_user
  puts "what do you want to know about this movie?"
  puts "episode_id, opening_crawl, director, producer, or release_date?"
  gets.strip.downcase
end
