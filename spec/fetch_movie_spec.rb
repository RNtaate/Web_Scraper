require 'rspec'
require './lib/fetch_movie.rb'
require 'nokogiri'
require 'open-uri'

describe Movie do
  let(:web_link) do
    'https://rawcdn.githack.com/RNtaate/Sound-Electronics-store/ccadeae6e3e1eda77681a48f5f835e974dddcbd5/index.html'
  end

  describe '#get_movie_content' do
    context 'When given css selector strings as arguments' do
      it 'Returns a string containing the contents of all elements of a NodeSet' do
        movie = Movie.new(web_link)
        expect(movie.get_movie_content('h1')).to eql('NORP ELECTRONICS')
      end
    end
  end

  describe '#display_movie_content' do
    context 'When given a webpage link string as an argument' do
      it 'Returns a string containing contents of elements from various NodeSets' do
        movie = Movie.new
        expect(movie.display_movie_content(web_link)).to be_a String
      end
    end
  end
end
