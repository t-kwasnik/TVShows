require 'rails_helper'

feature "user adds favorite TV show characters", %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

    # Acceptance Criteria:
    # * I can see a the show's title, network, the years it ran,
    # and a synopsis.

    scenario "user adds a character to TV show" do

      show = TelevisionShow.create(title: 'Arrested Development', network: 'IFC' )

      visit "/television_shows/#{show.id}"

      fill_in 'Character', with: "Michael Bluth"
      fill_in 'Actor', with: "Jason Bateman"
      fill_in 'Description', with: "main character"
      click_on 'Submit'

      expect(page).to have_content 'Success'
      expect(page).to have_content "Michael Bluth"
      expect(page).to have_content "Jason Bateman"
      expect(page).to have_content "main character"
    end

    scenario "description is optional" do

      show = TelevisionShow.create(title: 'Arrested Development', network: 'IFC' )

      visit "/television_shows/#{show.id}"

      fill_in 'Character', with: "Michael Bluth"
      fill_in 'Actor', with: "Jason Bateman"
      click_on 'Submit'

      expect(page).to have_content 'Success'
      expect(page).to have_content "Michael Bluth"
      expect(page).to have_content "Jason Bateman"
    end

    scenario "character name is required" do

      show = TelevisionShow.create(title: 'Arrested Development',
      network: 'IFC' )

      visit "/television_shows/#{show.id}"

      fill_in 'Actor', with: "Jason Bateman"
      click_on 'Submit'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content "Character name is required"
    end

    scenario "actor name is required" do

      show = TelevisionShow.create(title: 'Arrested Development',
      network: 'IFC' )

      visit "/television_shows/#{show.id}"

      fill_in 'Character', with: "Michael Bluth"
      click_on 'Submit'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content "Actor name is required"
    end

    scenario "actor name is required" do

      show = TelevisionShow.create(title: 'Arrested Development',
      network: 'IFC' )

      Character.create(television_show_id: show.id, character: "Michael Bluth", actor: "Jason Bateman" )

      visit "/television_shows/#{show.id}"

      fill_in 'Character', with: "Michael Bluth"
      fill_in 'Actor', with: "Jason Bateman"
      click_on 'Submit'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content "Character already exists"
    end

  end
