require 'rails_helper'

feature "user views a list of all TV characters", %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do

  # Acceptance Criteria:
  # * I can see a the show's title, network, the years it ran,
  # and a synopsis.

  scenario "user views a list of all characters" do

    show1 = TelevisionShow.create(title: "Arrested Development", network: "IFC" )
    show2 = TelevisionShow.create(title: "Modern Family", network: "ABC" )

    Character.create(television_show_id: show1.id,character: 'Michael Bluth', actor: 'Jason Bateman' )
    Character.create(television_show_id: show1.id,character: 'George Michael Bluth', actor: 'Micheal Sara' )
    Character.create(television_show_id: show2.id,character: 'Jay Pritchett', actor: 'Ed O\'Neill' )
    Character.create(television_show_id: show2.id,character: 'Claire Dunphy', actor: 'Julie Bowen' )
    Character.create(television_show_id: show2.id,character: 'Phil Dunphy', actor: 'Ty Burrell' )

    visit "/characters"

    expect(page).to have_content 'Michael Bluth'
    expect(page).to have_content 'George Michael Bluth'
    expect(page).to have_content 'Jay Pritchett'
    expect(page).to have_content 'Claire Dunphy'
    expect(page).to have_content 'Phil Dunphy'
  end

  scenario "user views associated TV show" do

    show1 = TelevisionShow.create(title: "Arrested Development", network: "IFC" )
    show2 = TelevisionShow.create(title: "Modern Family", network: "ABC" )

    Character.create(television_show_id: show1.id,character: 'Michael Bluth', actor: 'Jason Bateman' )
    Character.create(television_show_id: show1.id,character: 'George Michael Bluth', actor: 'Micheal Sara' )
    Character.create(television_show_id: show2.id,character: 'Jay Pritchett', actor: 'Ed O\'Neill' )
    Character.create(television_show_id: show2.id,character: 'Claire Dunphy', actor: 'Julie Bowen' )
    Character.create(television_show_id: show2.id,character: 'Phil Dunphy', actor: 'Ty Burrell' )


    visit "/characters"

    expect(page).to have_content "Arrested Development"
    expect(page).to have_content "Modern Family"

  end
end
