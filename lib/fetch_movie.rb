require 'nokogiri'
require 'open-uri'

class Movie
  def initialize(link)
    @doc = Nokogiri::HTML(URI.open(link))
  end

  def get_movie_content(*selector)
    list = @doc.css(*selector)
    return list
  end
end