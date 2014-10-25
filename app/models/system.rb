class System < ActiveRecord::Base
  has_many :clients
  has_many :users
  validates :schema, presence: true, uniqueness: { scope: :uid }, length: 3..50, format: { with: /\A[a-zA-Z][a-zA-Z0-9]{2,}\z/ }
  validates :name, presence: true, length: { maximum: 50 }
  validates :uid, :secret, presence: true, length: { is: 64 }

  def forever?
    timeout.nil?
  end

  def timeout?
    Date.current > timeout
  end
end
