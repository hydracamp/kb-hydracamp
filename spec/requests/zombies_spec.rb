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

end

describe "Zombie delete" do
  before do
    #Capybara.current_driver = :selenium
    @zombie1 = Zombie.create(:name => "Ash")
    @zombie1.save
    @zombie2 = Zombie.create(:name => "Sarah")
    @zombie2.save
    @count = Zombie.count
    #puts @count
  end
  it "should delete a zombie" do
    page.visit zombies_path
    page.click_link "delete_" + @zombie1.id.to_s
    #save_and_open_page
    #page.evaluate_script('data-confirm = function() { return true; }')
    #page.click('OK')
    #page.driver.browser.switch_to.alert.accept
    page.should have_content "Deleted Zombie 'Ash'"
  end
  after do
    #Capybara.use_default_driver
  end

end
