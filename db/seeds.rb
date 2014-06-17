# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    show1 = TelevisionShow.create(title: "Arrested Development", network: "IFC" )
    show2 = TelevisionShow.create(title: "Modern Family", network: "ABC" )

    Character.create(television_show_id: 1,character: 'Michael Bluth', actor: 'Jason Bateman' )
    Character.create(television_show_id: 1,character: 'George Michael Bluth', actor: 'Micheal Sara' )
    Character.create(television_show_id: 2,character: 'Jay Pritchett', actor: 'Ed O\'Neill' )
    Character.create(television_show_id: 2,character: 'Claire Dunphy', actor: 'Julie Bowen' )
    Character.create(television_show_id: 2,character: 'Phil Dunphy', actor: 'Ty Burrell' )
