require 'rspec'
require 'nokogiri'
require './lib/fetch_content.rb'

describe FetchContent do
  let(:web_link){'https://rawcdn.githack.com/RNtaate/Sound-Electronics-store/ccadeae6e3e1eda77681a48f5f835e974dddcbd5/index.html'}

  describe ".get_content" do

    it "Returns a NodeSet when provided a webpage link string and css node selectors as arguments" do
      expect(FetchContent.get_content(web_link, 'h1')[0].content).to eql("NORP ELECTRONICS")
    end

  end
end
