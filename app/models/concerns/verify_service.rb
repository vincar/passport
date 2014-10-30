class VerifyService
  def initialize( uid, session_token )
    @uid, @session_token = uid, session_token
  end

  def response_code
    return :uid_not_in_database if uid_not_in_database?
    return :uid_is_locked if system.locked?
    return :uid_is_timeout if system.timeout?
    return :session_token_not_match if client_not_in_database?
    return :client_is_inactivate if client_is_inactivate?
    :ok
  end

  private  
  def system
    @system ||= System.find_by( uid: @uid )
  end

  def client
    @client ||= system && system.clients.find_by( session_token: @session_token )
  end


  def uid_not_in_database?
    system.nil?
  end

  def client_not_in_database?
    client.nil?
  end

  def client_is_inactivate?
    client_not_in_database? || !client.activate?
  end
end