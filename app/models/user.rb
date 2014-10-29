class User < ActiveRecord::Base
  include ProfileService

  has_secure_password
  
  belongs_to :system
  has_one :profile, dependent: :destroy
  delegate :admin?, to: :profile

  validates :system_id, presence: true
  validates :username, presence: true, uniqueness: { scope: :system_id }, length: 4..50, format: { with: /\A[a-zA-Z0-9_]{4,50}\z/ }
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { scope: :system_id }

  def superadmin?
    system_id == 0 && admin?
  end
end