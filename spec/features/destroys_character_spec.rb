require 'rails_helper'

feature "destroy character entry", %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
} do

    # Acceptance Criteria:
    # * I can see a the show's title, network, the years it ran,
    # and a synopsis.

    scenario "destroy character entry" do

      show1 = TelevisionShow.create(title: "Arrested Development", network: "IFC" )

      Character.create(television_show_id: show1.id,character: 'Michael Bluth', actor: 'Jason Bateman' )

      visit "/television_shows/#{show1.id}"

      click_on 'Delete'

      expect(page).to_not have_content 'Michael Bluth'

    end

    scenario "error message on fail to save" do

      show1 = TelevisionShow.create(title: "Arrested Development", network: "IFC" )

      Character.create(television_show_id: show1.id,character: 'Michael Bluth', actor: 'Jason Bateman' )

      visit "/television_shows/#{show1.id}"

      click_on 'Delete'

      expect(page).to_not have_content 'Destroy failed'

    end
  end
