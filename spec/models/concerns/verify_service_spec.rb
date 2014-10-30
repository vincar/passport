require 'rails_helper'

RSpec.describe VerifyService, :type => :model do
  context 'with valid appid and session_token' do
    before :all do
      @client = create( :client, session_token: SecureRandom.hex(32)  )
      @system = @client.system
    end

    it 'should return :uid_is_locked when system is locked' do
      @system.update( locked: true )
      vs = VerifyService.new( @system.uid, @client.session_token )
      expect( vs.response_code ).to be == :uid_is_locked
    end

    it 'should return :uid_is_timeout when system is timeout' do
      @system.update( timeout: 1.days.ago )
      vs = VerifyService.new( @system.uid, @client.session_token )
      expect( vs.response_code ).to be == :uid_is_timeout
    end

    it 'should return :client_is_inactivate when client is inactivate' do
      @client.update( activate: false )
      vs = VerifyService.new( @system.uid, @client.session_token )
      expect( vs.response_code ).to be == :client_is_inactivate
    end

    it 'should return :ok when client is activate' do
      @client.update( activate: true )
      vs = VerifyService.new( @system.uid, @client.session_token )
      expect( vs.response_code ).to be == :ok
    end
  end

  context 'with invalid appid or session_token' do
    before :all do
      @client = create( :client, session_token: SecureRandom.hex(32)  )
      @system = @client.system
    end

    it 'should return :uid_not_in_database with invalid appid' do
      vs = VerifyService.new( SecureRandom.hex(32), @client.session_token )
      expect( vs.response_code ).to be == :uid_not_in_database
    end

    it 'should return :session_token_not_match with invalid session_token' do
      vs = VerifyService.new( @system.uid, SecureRandom.hex(32) )
      expect( vs.response_code ).to be == :session_token_not_match
    end
  end
end
