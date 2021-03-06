require 'spec_helper'

describe ZombiesController do

  describe "#new" do
    it "should set a template zombie" do
      get :new
      response.should be_successful
      assigns[:zombie].should be_kind_of Zombie
    end
  end
  
  describe "#create" do
    before do
      @count = Zombie.count  
    end
    it "should create a zombie" do
      post :create, :zombie=>{:name=>"Ash", :graveyard=>"Milltown Cemetery"}
      response.should redirect_to zombies_path
      Zombie.count.should == @count+1
      flash[:notice].should == "Added Zombie" 
    end
  end
  
    
  describe "#update" do
  
     before do
      @zombie1 = Zombie.create(:name => "Ash", :graveyard=>"Sleepy Hollow")
    end
  
    it "should update a zombie" do
      put :update, :id=>@zombie1.id, :zombie=>{:name=>"Ash II", :graveyard=>"New Sleppy Hollow"}
      response.should redirect_to zombies_path
      flash[:notice].should == "Updated zombie Ash II"
      zombieAfterUpdate = Zombie.find(@zombie1.id)
      zombieAfterUpdate.graveyard.should == "New Sleppy Hollow"
      zombieAfterUpdate.name.should == "Ash II"
      
    end
    
  end
  

  describe "#index" do
    before do
      @zombie1 = Zombie.create(:name => "Ash")
      @zombie2 = Zombie.create(:name => "Sarah")
    end
    it "should display a list of all the zombies" do
      get :index
      response.should be_successful
      assigns[:zombies].should == [@zombie1, @zombie2] 
    end 
  end

  describe "#delete" do
    before do
      @zombie1 = Zombie.create(:name => "Ash")
      @zombie2 = Zombie.create(:name => "Sarah")
      @count = Zombie.count  
    end
    it "should delete a named zombies" do
      delete :destroy, :id=>@zombie1.id
      Zombie.count.should == @count-1
      Zombie.all == [@zombie2] 
    end 
  end
end
