# app/models/user.rb

class User < ApplicationRecord
  has_many :tasks

  # Devise modules
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    [first_name, last_name].compact.join(' ')
  end
end
