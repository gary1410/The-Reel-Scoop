The Reel Scoop
==============

Key Features
------------
  * Users can do a live search via AJAX
  * AJAX on Column Sort of Title and Release Date
  * Users are able to See all Reviews, Review each of the Movies

Tests
-----

```sh
	rspec spec
```

Setup
-----

Seed movies from Rotten Tomatoes API

```ruby

rake db:seed_movies

```

Register for an API KEY [here](http://developer.rottentomatoes.com/)

http://developer.rottentomatoes.com/

Challenges
----------
  * Rotten Tomato API didn't allow me to easily pull down the genre.  Given more time I would have tried a different endpoint.  
  * I was calling the API from three different endpoints because I wanted to house in the Database three types of movies
    + Movies Soon to be Release
    + Wide Distribution
    + Top Box Office Movies
 	* Given the nature of the challenge, I wrongly assumed the genre was going to be in the same endpoints.  I would have then focused on getting the genre a bit more
 	* I chose to AJAX the search and the tables headings for a better user experience.  I'm not so sure it really matters in this instance since the there only roughly 144 movies in the DB.  If Rotten Tomatoes would have allowed more movies in the DB, it would matter a lot more.

