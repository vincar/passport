class System < ActiveRecord::Base
  has_many :clients
  has_many :users
  validates :name, presence: true, length: { maximum: 50 }
  validates :uid, :secret, presence: true, length: { is: 64 }

  before_create do
    self.uid = SecureRandom.hex(32)
    self.secret = SecureRandom.hex(32)
  end

  def forever?
    timeout.nil?
  end

  def timeout?
    Date.current > timeout
  end
end
