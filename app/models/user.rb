

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validatable
  include Clearance::User

  field :email, type: String
  field :encrypted_password, type: String
  field :confirmation_token, type: String
  field :remember_token, type: String
  field :name, type: String

  def self.find_by_email(email)
    User.where(email: email).first
  end
end
