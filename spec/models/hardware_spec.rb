require 'rails_helper'

RSpec.describe Hardware, :type => :model do
  subject { build( :hardware ) }
  it { should belong_to( :client ) }
  it { should validate_presence_of( :client_id ) }
  it { should validate_uniqueness_of( :client_id ).scoped_to( :hardware_code ) }
  it { should have_db_index( [ :client_id, :hardware_code ] ).unique }
end
