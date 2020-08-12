require 'nokogiri'
require 'open-uri'
require_relative 'fetch_messages.rb'

class Movie
  def initialize(link_string = nil)
    @doc = link_string.nil? ? '' : Nokogiri::HTML(URI.open(link_string))
    @string = ''
  end

  def get_movie_content(*selector)
    string = ''
    @doc.css(*selector).each do |item|
      string += item.content
    end
    string
  end

  def display_movie_content(link)
    @doc = Nokogiri::HTML(URI.open(link))
    "
    ---------Movie Information----------

    #{get_movie_content(FetchMessages::MOVIE_TITLE).upcase}

    Overview    :
    #{get_movie_content(FetchMessages::MOVIE_OVERVIEW)}


    Strarring   : #{get_movie_content(FetchMessages::MOVIE_STARS)}

    Duration    : #{get_movie_content(FetchMessages::MOVIE_DURATION)}
    Release Year: #{get_movie_content(FetchMessages::MOVIE_YEAR)}
    Genre       : #{get_movie_content(FetchMessages::MOVIE_GENRE)}
    Age Limit   : #{get_movie_content(FetchMessages::MOVIE_AGE)}"
  end
end
