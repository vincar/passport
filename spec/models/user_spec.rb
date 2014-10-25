require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { build( :user ) }
  it { should validate_presence_of( :system_id ) }
  it { should validate_presence_of( :username ) }
  it { should validate_uniqueness_of( :username ).scoped_to( :system_id ) }
  it { should ensure_length_of( :username ).is_at_least( 4 ).is_at_most( 50 ) }
  it { should_not allow_value( 'm@+-', '-user' ).for( :username ) }
  it { should allow_value( 'linq', 'lin2', '_lin', '9988' ).for( :username ) }
  it { should ensure_length_of( :password ).is_at_least( 6 ) }
  it { should validate_presence_of( :email ) }
  it { should validate_uniqueness_of( :email ).scoped_to( :system_id ) }
end
