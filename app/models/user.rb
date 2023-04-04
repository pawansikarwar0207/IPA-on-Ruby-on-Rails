class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable, :confirmable

  validates :full_name, presence:true
  
  validates :contact_number, numericality: true,  length:{ minimum: 10, maximum: 10},presence:true, uniqueness:true

  validates :contact_number, format: { with: /\A[6-9]\d{9}\z/, message: "must start with 6,7,8 or 9 and be 10 digits long" }


  has_many :likes
  has_many :questions, through: :likes

  has_many :plans

  has_many :user_plans
  has_many :plans, through: :user_plans


end
