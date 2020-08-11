#!/usr/bin/env ruby

class Scraper

  def initialize 
    @category_names = ""
    @categories = ""
    @choice = ""
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
    puts " "
    print "Enter \"y\" or \"yes\" if you wish to continue, and any other key otherwise. : "
    @choice = gets.chomp
  end
end

