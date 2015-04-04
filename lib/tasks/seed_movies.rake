namespace :db do
  desc 'Populate movie database'
  task :seed_movies => :environment do
    begin
      require 'dotenv'
      Dotenv.load
    rescue LoadError
    end
    include RottenTomatoes

    Rotten.api_key = ENV['ROTTEN_API_KEY']

    opening_movies = RottenList.find(type: 'opening', limit: 50)
    opening_movies.each do |rt_movie_data|
      new_movie = Movie.find_or_create_by(rotten_id: rt_movie_data.id)
      imdb_id = ( rt_movie_data.alternate_ids ? rt_movie_data.alternate_ids.imdb : "" )
      mob_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.thumbnail : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
      det_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.detailed : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
      rt_critics_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.critics_score : 0 )
      rt_audience_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.audience_score : 0 )
      release_date = ( rt_movie_data.release_dates ? rt_movie_data.release_dates.theater : "" )

      new_movie.update_attributes({
        title:              rt_movie_data.title.titleize,
        genre:              rt_movie_data.genre,
        imdb_id:            imdb_id,
        mob_poster_url:     mob_poster_url,
        det_poster_url:     det_poster_url,
        rt_critics_score:   rt_critics_score,
        rt_audience_score:  rt_audience_score,
        mpaa_rating:        rt_movie_data.mpaa_rating,
        synopsis:           rt_movie_data.synopsis,
        runtime:            rt_movie_data.runtime,
        release_date:       release_date
      })
    end

    in_theaters_movies = JSON(Rotten.get_url("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=" + Rotten.api_key + "&page_limit=50").body)["movies"].map { |movie| RottenMovie.new(movie, false) }
    in_theaters_movies += JSON(Rotten.get_url("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=" + Rotten.api_key + "&page_limit=50&page=2").body)["movies"].map { |movie| RottenMovie.new(movie, false) }
    in_theaters_movies += JSON(Rotten.get_url("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=" + Rotten.api_key + "&page_limit=50&page=3").body)["movies"].map { |movie| RottenMovie.new(movie, false) }
    in_theaters_movies += JSON(Rotten.get_url("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=" + Rotten.api_key + "&page_limit=50&page=4").body)["movies"].map { |movie| RottenMovie.new(movie, false) }

    in_theaters_movies.each do |rt_movie_data|
      new_movie = Movie.find_or_create_by(rotten_id: rt_movie_data.id)

      imdb_id = ( rt_movie_data.alternate_ids ? rt_movie_data.alternate_ids.imdb : "" )
      mob_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.thumbnail : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
      det_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.detailed : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
      rt_critics_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.critics_score : 0 )
      rt_audience_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.audience_score : 0 )
      release_date = ( rt_movie_data.release_dates ? rt_movie_data.release_dates.theater : "" )

      new_movie.update_attributes({
        title:              rt_movie_data.title.titleize,
        genre:              rt_movie_data.genre,
        imdb_id:            imdb_id,
        mob_poster_url:     mob_poster_url,
        det_poster_url:     det_poster_url,
        rt_critics_score:   rt_critics_score,
        rt_audience_score:  rt_audience_score,
        mpaa_rating:        rt_movie_data.mpaa_rating,
        synopsis:           rt_movie_data.synopsis,
        runtime:            rt_movie_data.runtime,
        release_date:       release_date
      })
    end

    top_box_office_movies = JSON(Rotten.get_url("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=" + Rotten.api_key + "&limit=30").body)["movies"].map { |movie| RottenMovie.new(movie, false) }

    top_box_office_movies.each do |rt_movie_data|
      new_movie = Movie.find_or_create_by(rotten_id: rt_movie_data.id)

      imdb_id = ( rt_movie_data.alternate_ids ? rt_movie_data.alternate_ids.imdb : "" )
      mob_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.thumbnail : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
      det_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.detailed : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
      rt_critics_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.critics_score : 0 )
      rt_audience_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.audience_score : 0 )
      release_date = ( rt_movie_data.release_dates ? rt_movie_data.release_dates.theater : "" )

      new_movie.update_attributes({
        title:              rt_movie_data.title.titleize,
        genre:              rt_movie_data.genre,
        imdb_id:            imdb_id,
        mob_poster_url:     mob_poster_url,
        det_poster_url:     det_poster_url,
        rt_critics_score:   rt_critics_score,
        rt_audience_score:  rt_audience_score,
        mpaa_rating:        rt_movie_data.mpaa_rating,
        synopsis:           rt_movie_data.synopsis,
        runtime:            rt_movie_data.runtime,
        release_date:       release_date
      })
    end
  end
end