require 'rails_helper'

RSpec.describe Client, :type => :model do
  subject { build( :client ) }
  it { should validate_presence_of( :name ) }
  it { should validate_uniqueness_of( :name ).scoped_to( :system_id ) }
  it { should validate_presence_of( :system_id ) }
  it { should belong_to( :system ) }
  it { should have_many( :hardwares ) }
  it { should have_db_index( :system_id ) }
  it { should have_db_index( [ :name, :system_id ] ).unique }
end
