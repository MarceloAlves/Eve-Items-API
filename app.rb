require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'json'

set :port, 80
set :environment, :production

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/item-database.db")

class InvTypes
  include DataMapper::Resource

  property :typeID, Integer, :key => true
  property :groupID, Integer
  property :typeName, Text
  property :description, Text
  property :mass, Integer
  property :volume, Integer
  property :capacity, Integer
  property :portionSize, Integer
  property :raceID, Integer
  property :basePrice, Integer
  property :published, Integer
  property :marketGroupID, Integer
  property :chanceOfDuplicating, Integer
  property :radius, Integer
  property :iconID, Integer
  property :graphicID, Integer
  property :soundID, Integer
  property :factionID, Integer
end

get '/' do
  
end

get '/item/:item' do
  @items = InvTypes.get(params[:item])
  status 200
  return @items.to_json
end