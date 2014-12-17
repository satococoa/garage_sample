class User < ActiveRecord::Base
  include Garage::Representer
  has_many :posts

  property :id
  property :first_name
  property :last_name

end
