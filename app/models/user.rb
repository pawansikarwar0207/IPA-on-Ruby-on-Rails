class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable, :confirmable,
  :omniauthable, omniauth_providers: %i[google_oauth2]

  validates :full_name, presence:true
  
  validates :contact_number, numericality: true,  length:{ minimum: 10, maximum: 10},presence:true, uniqueness:true

  validates :contact_number, format: { with: /\A[6-9]\d{9}\z/, message: "must start with 6,7,8 or 9 and be 10 digits long" }

  has_many :likes
  has_many :questions, through: :likes

  has_many :plans

  has_many :user_plans
  has_many :plans, through: :user_plans

  has_many :user_reactions

  has_many :comments, as: :commentable

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(
       email: data['email'],
       password: Devise.friendly_token[0,20]
       )
    end
    user
  end

end
