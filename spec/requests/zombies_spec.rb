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

