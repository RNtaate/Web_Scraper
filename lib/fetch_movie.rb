require 'nokogiri'
require 'open-uri'

class Movie
  def initialize(link)
    @doc = Nokogiri::HTML(URI.open(link))
    @string = ''
  end

  def get_movie_content(*selector)
    string = ''
    @doc.css(*selector).each do |item|
      string += item.content
    end
    string
  end

  def display_movie_content
    "
    ---------Movie Information----------

    #{get_movie_content('h1.title-title').upcase}

    Overview :
    #{get_movie_content('div.title-info-synopsis')}


    #{get_movie_content('span.title-data-info-item-label', 'span.title-data-info-item-list')}

    Duration    : #{get_movie_content('span.duration')}
    Release Year: #{get_movie_content('span.item-year')}
    Genre       : #{get_movie_content('a.item-genre')}
    Age Limit   : #{get_movie_content('span.maturity-number')}"
  end
end