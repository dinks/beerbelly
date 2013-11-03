# encoding: UTF-8

require 'spec_helper'

describe Beerbelly::Client::Beer do

  before(:each) do
    BeerbellySetup.configure
  end

  context 'get beers' do

    let(:beers) do
      VCR.use_cassette('all_beer') do
        beers = Beerbelly.beers
      end
    end

    it 'should have 50 entries' do
      expect(beers.length).to eql(50)
    end

  end

  context 'get beer' do

    let(:beer) do
      VCR.use_cassette('one_beer') do
        beers = Beerbelly.beer(1)
      end
    end

    it 'should have 1 entries' do
      expect(beer.length).to eql(1)
    end

  end

end
