module ProfileService
  extend ActiveSupport::Concern

  included do
    after_create do
      self.create_profile()
    end
  end
end