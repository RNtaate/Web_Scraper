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

  def self.get_inner_content(list, number, selector)
    another_list = list[number].css(selector)
    another_list
  end

  def self.validate_input(list, number)
    return true if (1..list.length).include? number
    false
  end
end
