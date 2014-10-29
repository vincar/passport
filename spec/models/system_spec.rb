require 'rails_helper'

RSpec.describe System, :type => :model do
  subject { build( :system ) }
  let( :forever ) { build( :system, :forver ) }
  let( :locked ) { build( :system, :locked ) }
  let( :timeout ) { build( :system, :timeout ) }
  let( :autorise ) { build( :system, :autorise ) }

  it { should validate_presence_of( :name ) }
  it { should ensure_length_of( :name ).is_at_most( 50 ) }
  it { should validate_presence_of( :uid ) }
  it { should validate_presence_of( :secret ) }
  it { should have_many( :clients ) }
  it { should have_many( :users ) }
  it { should have_db_index( :uid ).unique }

  it 'should forever when timeout is nil' do
    expect( forever ).to be_forever
  end

  it 'should locked when locked is set to true' do
    expect( locked ).to be_locked
  end

  it 'should timeout when timeout field is less than today' do
    expect( timeout ).to be_timeout
  end

  it 'should not be autorise by default' do
    expect( subject ).to_not be_autorise
  end

  it 'should autorise when autorise is set true' do
    expect( autorise ).to be_autorise
  end
end
