require 'rspec'
require 'nokogiri'
require 'open-uri'
require './lib/fetch_content.rb'

describe FetchContent do
  let(:web_link){'https://rawcdn.githack.com/RNtaate/Sound-Electronics-store/ccadeae6e3e1eda77681a48f5f835e974dddcbd5/index.html'}

  let(:array){[1, 2, 3, 4]}

  describe ".get_content" do

    it "Returns a NodeSet when provided a webpage link string and css node selectors as arguments" do
      expect(FetchContent.get_content(web_link, 'h1')[0].content).to eql("NORP ELECTRONICS")
    end

  end

  describe ".get_inner_content" do

    it "Returns a new NodeSet when given, a NodeSet, a number, and a css selector string as arguments" do
      doc = Nokogiri::HTML(URI.open(web_link))
      list = doc.css('div.section-heading-div')
      expect(FetchContent.get_inner_content(list, 0, 'h6')[0].content).to eql("Home Sytems")
    end
  end

  describe ".validate_input" do

    context "Second argument included in range of 1 to first argument's length" do
      it{expect(FetchContent.validate_input(array, 2)).to be true}
    end

    context "Second argument not included in range of 1 to first argument's length" do
      it{expect(FetchContent.validate_input(array, 5)).to be false}
    end
  end
end
