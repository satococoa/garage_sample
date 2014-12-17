class User < ActiveRecord::Base
  include Garage::Representer
  include Garage::Authorizable
  has_many :posts

  property :id
  property :first_name
  property :last_name
  property :full_name

  def full_name
    first_name + ' ' + last_name
  end

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end
end
