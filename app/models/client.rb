class Client < ActiveRecord::Base
  belongs_to :system
  has_many :hardwares
  validates :name, presence: true, uniqueness: { scope: :system_id }, length: { maximum: 50 }
  validates :system_id, presence: true
end
