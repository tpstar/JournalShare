class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :article_users
  has_many :articles, :through => :article_users

  has_many :active_requests, class_name: 'Demand',
                             foreign_key: 'reader_id',
                             dependent: :destroy
  has_many :passive_requests, class_name: 'Demand',
                              foreign_key: 'author_id',
                              dependent: :destroy
  has_many :authors, :through => :active_requests
  has_many :readers, :through => :passive_requests


  def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(:email => data["email"]).first

     unless user
         user = User.create(
            email: data[:email],
            first_name: data[:first_name],
            last_name: data[:last_name],
            password: Devise.friendly_token[0,20]
         )
     end
     user
   end

   def self.search(first_name, last_name)
     User.where("first_name = ? AND last_name = ?" , first_name, last_name)
   end

end
