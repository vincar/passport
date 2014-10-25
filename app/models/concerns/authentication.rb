module Authentication
  included do
    has_secure_password
  end

  module ClassMethods
    def authenticate!( username, password )
    end

    def register( options )
      
    end
  end

  def password_reset!
    
  end
end