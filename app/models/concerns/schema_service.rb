module SchemaService
  extend ActiveSupport::Concern

  included do
    after_create do
      # ActiveRecord::Base.connection.schema_search_path = 'linq'
      # load "#{Rails.root}/db/schema.rb"
    end
  end

  module ClassMethods
  end
end