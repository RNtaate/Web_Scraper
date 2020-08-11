require 'nokogiri'
require 'open-uri'

class Movie
  def initialize(link)
    @doc = Nokogiri::HTML(URI.open(link))
  end
end