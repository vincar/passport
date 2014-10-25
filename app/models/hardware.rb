class Hardware < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true, uniqueness: { scope: :hardware_code }
  validates :hardware_code, null: false
end
