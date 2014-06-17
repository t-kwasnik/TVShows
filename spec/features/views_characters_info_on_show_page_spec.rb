require 'rails_helper'

feature "user charcter info on TV show page", %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can find learn more about it
  I can see a the show's title, network, the years it ran, and a synopsis.
} do

  # Acceptance Criteria:
  # * I can see a the show's title, network, the years it ran,
  # and a synopsis.

  scenario "user views a TV show's details" do

    show1 = TelevisionShow.create(title: "Arrested Development", network: "IFC" )
    show2 = TelevisionShow.create(title: "Modern Family", network: "ABC" )

    Character.create(television_show_id: show1.id,character: 'Michael Bluth', actor: 'Jason Bateman' )
    Character.create(television_show_id: show1.id,character: 'George Michael Bluth', actor: 'Micheal Sara', description: 'son' )
    Character.create(television_show_id: show2.id,character: 'Jay Pritchett', actor: 'Ed O\'Neill' )
    Character.create(television_show_id: show2.id,character: 'Claire Dunphy', actor: 'Julie Bowen' )
    Character.create(television_show_id: show2.id,character: 'Phil Dunphy', actor: 'Ty Burrell', description: 'father' )

    visit "/television_shows/#{show1.id}"

    expect(page).to have_content 'Michael Bluth'
    expect(page).to have_content 'son'
    expect(page).to have_content 'George Michael Bluth'
    expect(page).to have_content 'Micheal Sara'

    visit "/television_shows/#{show2.id}"

    expect(page).to have_content 'Jay Pritchett'
    expect(page).to have_content 'father'
    expect(page).to have_content 'Claire Dunphy'
    expect(page).to have_content 'Julie Bowen'

  end
end
