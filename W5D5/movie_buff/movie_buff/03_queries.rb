def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  those_movies = Actor.joins(:movies).where(name: those_actors).select('movies.title')

  those_actors.each do |actor|
    those_movies = Actor.joins(:movies).where(name: actor).where('movies.title IN (?)', those_movies).select('movies.title')
  end
  
  those_movies.select('movies.id', 'movies.title')
end

def golden_age
  # Find the decade with the highest average movie score.
  # as decade floor yr / 10

  Movie
    .group('(FLOOR(yr/10) * 10)')
    .order('AVG(score) DESC')
    .pluck('(FLOOR(yr/10) * 10)').first.to_i

end

def costars(other_name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  all_movies = Actor.joins(:movies).where(name: other_name).select('movie_id')

  Actor
    .joins(:castings)
    .where('movie_id IN (?)', all_movies)
    .where.not(name: other_name)
    .order(:name)
    .distinct
    .pluck(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:castings)
    .where('castings.movie_id IS NULL')
    .count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

  match = "%"

  whazzername.each_char do |char|
      match.concat(char.upcase)
      match.concat("%")
  end

  Movie
    .joins(:actors)
    .where("UPPER(actors.name) LIKE ?", match)

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

  Actor
    .joins(:movies)
    .group(:name, :id)
    .order('MAX(movies.yr) - MIN(movies.yr) DESC')
    .limit(3)
    .select('MAX(movies.yr) - MIN(movies.yr) AS career', :id, :name)
    .order(:name)
end
