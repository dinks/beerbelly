# encoding: UTF-8

require 'spec_helper'

describe Beerbelly::Client::Brewery do

  before(:each) do
    BeerbellySetup.configure
  end

  context 'get breweries' do

    let(:breweries) do
      VCR.use_cassette('all_breweries') do
        Beerbelly.breweries
      end
    end

    it 'should have more than 0 entries' do
      expect(breweries.objects.length).to_not eql(0)
    end

  end

  context 'get brewery' do

    let(:brewery) do
      VCR.use_cassette('one_brewery') do
        Beerbelly.brewery(1)
      end
    end

    it 'should have 1 entries' do
      expect(brewery.objects.length).to eql(1)
    end

  end

end
