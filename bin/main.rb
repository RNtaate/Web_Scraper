#!/usr/bin/env ruby

class Scraper

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
end

sm = Scraper.new

sm.welcome