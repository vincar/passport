class Application < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
