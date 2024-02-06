# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Create a new Studio instance
warner_bros = Studio.new

# Save the studio to the database
warner_bros.save

# Batman Begins
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = warner_bros["id"]
batman_begins.save

# The Dark Knight
the_dark_knight = Movie.new
the_dark_knight["title"] = "The Dark Knight"
the_dark_knight["year_released"] = 2008
the_dark_knight["rated"] = "PG-13"
the_dark_knight["studio_id"] = warner_bros["id"]
the_dark_knight.save

# The Dark Knight Rises
the_dark_knight_rises = Movie.new
the_dark_knight_rises["title"] = "The Dark Knight Rises"
the_dark_knight_rises["year_released"] = 2012
the_dark_knight_rises["rated"] = "PG-13"
the_dark_knight_rises["studio_id"] = warner_bros["id"]
the_dark_knight_rises.save

christian = Actor.new
christian["name"] = "Christian Bale"
christian.save

michael = Actor.new
michael["name"] =  "Michael Caine"
michael.save

liam = Actor.new
liam["name"] = "Liam Neeson"
liam.save

katie = Actor.new
katie["name"] = "Katie Holmes"
katie.save

gary = Actor.new
gary["name"] = "Gary Oldman"
gary.save

heath = Actor.new
heath["name"] = "Heath Ledger"
heath.save

aaron = Actor.new
aaron["name"] = "Aaron Eckhart"
aaron.save

maggie = Actor.new
maggie["name"] = "Maggie Gyllenhaal"
maggie.save

tom = Actor.new
tom["name"] = "Tom Hardy"
tom.save

joseph = Actor.new
joseph["name"] = "Joseph Gordon-Levitt"
joseph.save

anne = Actor.new
anne["name"] = "Anne Hathaway"
anne.save

# Batman Begins roles
bruce_wayne_bb = Role.new
bruce_wayne_bb["movie_id"] = batman_begins["id"]
bruce_wayne_bb["actor_id"] = christian["id"]
bruce_wayne_bb["character_name"] = "Bruce Wayne"
bruce_wayne_bb.save

alfred_bb = Role.new
alfred_bb["movie_id"] = batman_begins["id"]
alfred_bb["actor_id"] = michael["id"]
alfred_bb["character_name"] = "Alfred"
alfred_bb.save

ras_al_ghul_bb = Role.new
ras_al_ghul_bb["movie_id"] = batman_begins["id"]
ras_al_ghul_bb["actor_id"] = liam["id"]
ras_al_ghul_bb["character_name"] = "Ra's Al Ghul"
ras_al_ghul_bb.save

rachel_dawes_bb = Role.new
rachel_dawes_bb["movie_id"] = batman_begins["id"]
rachel_dawes_bb["actor_id"] = katie["id"]
rachel_dawes_bb["character_name"] = "Rachel Dawes"
rachel_dawes_bb.save

commissioner_gordon_bb = Role.new
commissioner_gordon_bb["movie_id"] = batman_begins["id"]
commissioner_gordon_bb["actor_id"] = gary["id"]
commissioner_gordon_bb["character_name"] = "Commissioner Gordon"
commissioner_gordon_bb.save

# The Dark Knight roles
bruce_wayne_tdk = Role.new
bruce_wayne_tdk["movie_id"] = the_dark_knight["id"]
bruce_wayne_tdk["actor_id"] = christian["id"]
bruce_wayne_tdk["character_name"] = "Bruce Wayne"
bruce_wayne_tdk.save

joker_tdk = Role.new
joker_tdk["movie_id"] = the_dark_knight["id"]
joker_tdk["actor_id"] = heath["id"]
joker_tdk["character_name"] = "Joker"
joker_tdk.save

harvey_dent_tdk = Role.new
harvey_dent_tdk["movie_id"] = the_dark_knight["id"]
harvey_dent_tdk["actor_id"] = aaron["id"]
harvey_dent_tdk["character_name"] = "Harvey Dent"
harvey_dent_tdk.save

alfred_tdk = Role.new
alfred_tdk["movie_id"] = the_dark_knight["id"]
alfred_tdk["actor_id"] = michael["id"]
alfred_tdk["character_name"] = "Alfred"
alfred_tdk.save

rachel_dawes_tdk = Role.new
rachel_dawes_tdk["movie_id"] = the_dark_knight["id"]
rachel_dawes_tdk["actor_id"] = maggie["id"]
rachel_dawes_tdk["character_name"] = "Rachel Dawes"
rachel_dawes_tdk.save

# The Dark Knight Rises roles
bruce_wayne_tdkr = Role.new
bruce_wayne_tdkr["movie_id"] = the_dark_knight_rises["id"]
bruce_wayne_tdkr["actor_id"] = christian["id"]
bruce_wayne_tdkr["character_name"] = "Bruce Wayne"
bruce_wayne_tdkr.save

commissioner_gordon_tdkr = Role.new
commissioner_gordon_tdkr["movie_id"] = the_dark_knight_rises["id"]
commissioner_gordon_tdkr["actor_id"] = gary["id"]
commissioner_gordon_tdkr["character_name"] = "Commissioner Gordon"
commissioner_gordon_tdkr.save

bane_tdkr = Role.new
bane_tdkr["movie_id"] = the_dark_knight_rises["id"]
bane_tdkr["actor_id"] = tom["id"]
bane_tdkr["character_name"] = "Bane"
bane_tdkr.save

john_blake_tdkr = Role.new
john_blake_tdkr["movie_id"] = the_dark_knight_rises["id"]
john_blake_tdkr["actor_id"] = joseph["id"]
john_blake_tdkr["character_name"] = "John Blake"
john_blake_tdkr.save

selina_kyle_tdkr = Role.new
selina_kyle_tdkr["movie_id"] = the_dark_knight_rises["id"]
selina_kyle_tdkr["actor_id"] = anne["id"]
selina_kyle_tdkr["character_name"] = "Selina Kyle"
selina_kyle_tdkr.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
movies = Movie.all

for movie in movies
  studio = Studio.find_by({"id" => movie["studio_id"]})
  studio_name = studio["name"]
  puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio_name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
roles = Role.all

for role in roles
  movie = Movie.find_by({"id" => role["movie_id"]})
  actor = Actor.find_by({"id" => role["actor_id"]})

  movie_title = movie["title"]
  actor_name = actor["name"]
  character_name = role["character_name"]

  puts "#{movie_title} #{actor_name} #{character_name}"
end