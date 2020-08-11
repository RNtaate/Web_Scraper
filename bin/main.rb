#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require './lib/fetch_content.rb'
require './lib/fetch_messages.rb'

class Scraper
  def initialize
    @category_names = ''
    @categories = ''
    @movies_list = ''
    @choice = ''
    @number = 0
  end

  def welcome
    puts "
                        Welcome to NORP FLIX
                        ********************
        A place of information about the available NETFLIX movies

      Simply select a category from the category list, choose a movie
                from the provided list of that category and
                      receive information about it
    ====================================================================
    "
  end

  def proceed_choice
    puts ' '
    print 'Enter "y" or "yes" if you wish to continue, and any other key otherwise. : '
    @choice = gets.chomp
  end

  def display_list(node_set_array)
    node_set_array.length.times do |i|
      puts "#{i + 1}    #{node_set_array[i].content}"
    end
  end

  def run
    welcome
    proceed_choice
    if @choice.downcase == 'y' or @choice.downcase == "yes"
      puts " "
      puts "Fetching content ..."

      @category_names = FetchContent.get_content(FetchMessages::MAIN_LINK, FetchMessages::CATEGORY_NAME)

      @categories = FetchContent.get_content(FetchMessages::MAIN_LINK, FetchMessages::CATEGORY_SECTION)

      puts " "
      puts "The following are the Categories available on NETFLIX.\n"
      puts "Please select a number of your choice to view the movies in that category."

      display_list(@category_names)
    end
  end
end

sm = Scraper.new

sm.run