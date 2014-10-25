class User < ActiveRecord::Base
  has_secure_password
  belongs_to :system

  validates :system_id, presence: true
  validates :username, presence: true, uniqueness: { scope: :system_id }, length: 4..50, format: { with: /\A[a-zA-Z0-9_]{4,50}\z/ }
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { scope: :system_id }
end
