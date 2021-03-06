Garage.configure {}
Garage::TokenScope.configure do
  register :public, desc: 'accessing publicly available data' do
    access :read, User
    access :write, User
  end
end

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)

  resource_owner_from_credentials do |routes|
    User.find_by(id: params[:user_id])
  end
end
