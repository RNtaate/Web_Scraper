#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength
require 'nokogiri'
require 'open-uri'
require './lib/fetch_content.rb'
require './lib/fetch_messages.rb'
require './lib/fetch_movie.rb'
require './lib/user_messages.rb'

class Scraper
  def initialize
    @category_names = ''
    @categories = ''
    @movies_list = ''
    @movie = ''
    @choice = ''
    @number = 0
    @movie_number = 0
    @movie_information = Movie.new
  end

  private
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

  def fetch_category_content
    @category_names = FetchContent.get_content(FetchMessages::MAIN_LINK, FetchMessages::CATEGORY_NAME)

    @categories = FetchContent.get_content(FetchMessages::MAIN_LINK,
                                           FetchMessages::CATEGORY_SECTION)
  end

  def display_list(node_set_array)
    node_set_array.length.times do |i|
      word = '' + node_set_array[i].content
      word.gsub!('Explore more', '')
      word = "#{i + 1}.)\t" + word
      puts word
    end
  end

  def validate_messages
    puts ' '
    puts 'Invalid input, input entered is either not a number or is out of list range.'
    print 'Enter a valid above list number : '
  end

  def specify_category_name(list, number)
    cat_name = '' + list[number].content + ' category : '
    cat_name.gsub!('Explore more', '')
    cat_name = "
    #{cat_name}
    "
    cat_name
  end

  public
  def run
    welcome
    proceed_choice
    return unless @choice.downcase == 'y' or @choice.downcase == 'yes'

    puts UserMessages::FETCHING_CONTENT_MESSAGE
    fetch_category_content

    while @choice.downcase == 'y' or @choice.downcase == 'yes'
      puts UserMessages::CATEGORY_LIST_MESSAGE
      display_list(@category_names)

      print UserMessages::CATEGORY_CHOICE
      @number = gets.chomp.to_i

      until FetchContent.validate_input(@category_names, @number)
        validate_messages
        @number = gets.chomp.to_i
      end

      @number -= 1
      @movies_list = FetchContent.get_inner_content(@categories, @number, 'a')

      puts specify_category_name(@category_names, @number)
      display_list(@movies_list)

      print UserMessages::MOVIE_CHOICE
      @movie_number = gets.chomp.to_i

      until FetchContent.validate_input(@movies_list, @movie_number)
        validate_messages
        @movie_number = gets.chomp.to_i
      end

      @movie_number -= 1
      @movie = @movies_list[@movie_number]['href']
      puts UserMessages::FETCHING_MOVIE_MESSAGE

      puts @movie_information.display_movie_content(@movie)

      proceed_choice
    end
    puts ' '
    puts 'Thank you for visiting us! **GOOD BYE**'
  end
end
# rubocop:enable Metrics/MethodLength

sm = Scraper.new

sm.run
