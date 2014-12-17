class Post < ActiveRecord::Base
  include Garage::Representer

  belongs_to :user
  property :body
end
