require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { build( :user ) }
  it { should belong_to( :system ) }
  it { should have_one( :profile ) }
  it { should validate_presence_of( :system_id ) }
  it { should validate_presence_of( :username ) }
  it { should validate_uniqueness_of( :username ).scoped_to( :system_id ) }
  it { should ensure_length_of( :username ).is_at_least( 4 ).is_at_most( 50 ) }
  it { should_not allow_value( 'm@+-', '-user' ).for( :username ) }
  it { should allow_value( 'linq', 'lin2', '_lin', '9988' ).for( :username ) }
  it { should ensure_length_of( :password ).is_at_least( 6 ) }
  it { should validate_presence_of( :email ) }
  it { should validate_uniqueness_of( :email ).scoped_to( :system_id ) }
  it { should have_db_index( :system_id ) }
  it { should have_db_index( [ :system_id, :username ] ).unique }
  it { should have_db_index( [ :system_id, :email ] ).unique }

  it 'should have a profile after user create' do
    user = create( :user )
    expect( user.profile ).to be_an_instance_of( Profile )
  end

  it 'should be superadmin when system_id equals 0 and admin is true' do
    user = create( :user, system_id: 0 )
    user.profile.update( admin: true )
    expect( user ).to be_superadmin
  end

  it 'should be admin when admin is true' do
    user = create( :user )
    user.profile.update( admin: true )
    expect( user ).to be_admin
  end

  it 'should remove user\'profile when user deleted' do
    user = create( :user )
    user.destroy
    profile = Profile.find_by( user_id: user.id )
    expect( profile ).to be_nil
  end
end
