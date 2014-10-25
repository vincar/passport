class Client < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :system_id }, length: { maximum: 50 }
  validates :system_id, presence: true
  belongs_to :system
end
