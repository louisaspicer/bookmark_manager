require 'data_mapper'
require 'dm-postgres-adapter'

class User
  
  include DataMapper::Resource
  property :id, Serial
  property :email, String

  #has n, :links, :through => Resource
end
