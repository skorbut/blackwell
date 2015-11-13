

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validatable
  include Clearance::User

  field :email, type: String
  field :encrypted_password, type: String
  field :confirmation_token, type: String
  field :remember_token, type: String
end
