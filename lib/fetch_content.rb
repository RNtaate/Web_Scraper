#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require_relative 'fetch_messages.rb'

class FetchContent
  def self.get_content(main_link, *selectors)
    doc = Nokogiri::HTML(URI.open(main_link))
    list = doc.css(*selectors)
    list
  end
end
