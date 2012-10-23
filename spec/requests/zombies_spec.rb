require 'spec_helper'

describe "Zombies" do
      
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
     @zombie2 = Zombie.create!({:name=> "Alex", :graveyard=> "KB"})  
     @zombie3 = Zombie.create!({:name=> "Nader", :graveyard=> "KB"})  
  	end 
  
    it "should edit a zombie" do
      visit zombies_path
      page.should have_content "edit"
      page.should have_content "Andreas"
      click_link "edit Andreas"
      
   	  # visit edit_zombie_path(:id => @zombie.id)
   	  
      fill_in "Name", :with =>'Ash II'
      fill_in "Graveyard", :with =>'Milltown'

      click_button "Update"
      page.should have_content "Updated zombie Ash II"
      
  	end
  end 
  
	context "creating tweets" do
		before do
			@zombie = Zombie.create(:name=>"Bones", :graveyard=>"SB")
		end

		it "should create tweets" do
			#Given I am viewing the list of tweets for a zombie
			visit zombie_path @zombie
			#When I fill in the message of "This is my tweet"
			fill_in "Message", :with => 'This is my Tweet'
			#And I click "Create Tweet"
			click_button "Create Tweet"
			#Then I should return to the list of tweets for the zombie
			#And I should see "This is my tweet" at the top of the list of tweets
			page.should have_selector "ul li:first", :text=>'This is my Tweet'
		end
	end
end
