require 'spec_helper'

describe "Zombies" do
  before do
     @zombie = Zombie.create!({:name=> "Ash", :graveyard=> "KB"})  
  end 
      
  it "should create a zombie" do
      visit new_zombie_path
      fill_in "Name", :with =>'Ash'
      fill_in "Graveyard", :with =>'Milltown'

      click_button "Create"
      page.should have_content "Added Zombie"
      page.should have_content "Ash"
  end
  
  
  context "when there is one zombie" do
    before do
     @zombie = Zombie.create!({:name=> "Andreas", :graveyard=> "KB"})  
  	end 
  
    it "should edit a zombie" do
      visit zombies_path
      page.should have_content "edit"
      page.should have_content "Andreas"
      click_link "edit"
      
   	  # visit edit_zombie_path(:id => @zombie.id)
   	  
      fill_in "Name", :with =>'Ash II'
      fill_in "Graveyard", :with =>'Milltown'

      click_button "Update"
      page.should have_content "Updated zombie Ash II"
      
  	end
  end 
  

  
  
end

