require_relative '../../spec_helper'

describe SeasonsInTheSun do
  describe "lookup accepts Date" do
    it "should accept a Date" do
      SeasonsInTheSun[:modern_mid_latitude_meteorological].lookup(Date.new(2013,6,1)).should == SeasonsInTheSun::WINTER
    end
    it "should not accept a String" do
      lambda {SeasonsInTheSun[:modern_mid_latitude_meteorological].lookup("hola!")}.should raise_error(RuntimeError)
    end
    it "should not accept an Integer" do
      lambda {SeasonsInTheSun[:modern_mid_latitude_meteorological].lookup(5)}.should raise_error(RuntimeError)
    end
    it "should check hemisphere setting" do
      lambda {SeasonsInTheSun[:modern_mid_latitude_meteorological].set_options(hemisphere: :northern)}.should_not raise_error
      lambda {SeasonsInTheSun[:modern_mid_latitude_meteorological].set_options(hemisphere: :eastern)}.should raise_error(RuntimeError)
      lambda {SeasonsInTheSun[:modern_mid_latitude_meteorological].set_options(hemisphere: :southern)}.should_not raise_error
    end
  end
  describe "Southern Hemisphere" do
    before(:each) do
      @reckoning = SeasonsInTheSun[:modern_mid_latitude_meteorological]
    end
    it 'should return season winter' do
      @reckoning.lookup(DateTime.new(2013,6,1)).should == SeasonsInTheSun::WINTER
    end
    it 'should return season winter at end of winter' do
      @reckoning.lookup(DateTime.new(2013,8,31)).should == SeasonsInTheSun::WINTER
    end
    it 'should return season spring' do
      @reckoning.lookup(DateTime.new(2013,9,1)).should == SeasonsInTheSun::SPRING
    end
    it 'should return season spring at end of spring' do
      @reckoning.lookup(DateTime.new(2013,11,30)).should == SeasonsInTheSun::SPRING
    end
    it 'should return season summer' do
      @reckoning.lookup(DateTime.new(2013,12,1)).should == SeasonsInTheSun::SUMMER
    end
    it 'should return season summer at end of summer' do
      @reckoning.lookup(DateTime.new(2014,2,28)).should == SeasonsInTheSun::SUMMER
    end
    it 'should return season summer at leap year 2012' do
      @reckoning.lookup(DateTime.new(2012,2,29)).should == SeasonsInTheSun::SUMMER
    end
    it 'should return season autumn' do
      @reckoning.lookup(DateTime.new(2014,3,1)).should == SeasonsInTheSun::AUTUMN
    end
    it 'should return season autumn at end of autumn' do
      @reckoning.lookup(DateTime.new(2013,5,31)).should == SeasonsInTheSun::AUTUMN
    end
  end
  describe "Northern Hemisphere" do
    before(:each) do
      @reckoning = SeasonsInTheSun[:modern_mid_latitude_meteorological]
      @reckoning.set_options(hemisphere: :northern)
    end
    it 'should return season winter' do
      @reckoning.lookup(DateTime.new(2013,12,1)).should == SeasonsInTheSun::WINTER
    end
    it 'should return season winter at end of winter' do
      @reckoning.lookup(DateTime.new(2013,2,28)).should == SeasonsInTheSun::WINTER
    end
    it 'should return season winter at leap year 2012' do
      @reckoning.lookup(DateTime.new(2012,2,29)).should == SeasonsInTheSun::WINTER
    end
    it 'should return season spring' do
      @reckoning.lookup(DateTime.new(2013,3,1)).should == SeasonsInTheSun::SPRING
    end
    it 'should return season spring at end of spring' do
      @reckoning.lookup(DateTime.new(2013,5,31)).should == SeasonsInTheSun::SPRING
    end
    it 'should return season summer' do
      @reckoning.lookup(DateTime.new(2013,6,1)).should == SeasonsInTheSun::SUMMER
    end
    it 'should return season summer at end of summer' do
      @reckoning.lookup(DateTime.new(2014,8,31)).should == SeasonsInTheSun::SUMMER
    end
    it 'should return season autumn' do
      @reckoning.lookup(DateTime.new(2014,9,1)).should == SeasonsInTheSun::AUTUMN
    end
    it 'should return season autumn at end of autumn' do
      @reckoning.lookup(DateTime.new(2013,11,30)).should == SeasonsInTheSun::AUTUMN
    end
  end
end