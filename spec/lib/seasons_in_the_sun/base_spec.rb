require_relative '../../spec_helper'

describe SeasonsInTheSun do
  it 'should return correct version string' do
    SeasonsInTheSun.version_string.should == "SeasonsInTheSun version #{SeasonsInTheSun::VERSION}"
  end
  it 'should recognize Modern Mid-latitude Meteorological' do
    SeasonsInTheSun[:modern_mid_latitude_meteorological].should_not be_nil
  end
  it 'should reject unrecognized strategy' do
    lambda {SeasonsInTheSun[:unknown_reckoning]}.should raise_error(RuntimeError)
  end
end