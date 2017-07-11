require('pry-byebug')
require_relative('../models/bounty')

Bounty.delete_all

bounty1 = Bounty.new( { 'name' => 'Joe the Bounty', 'species' => 'spacechimp', 'bounty_value' => 300, 'homeworld' => 'Planet of the Apes' } )
bounty2 = Bounty.new( { 'name' => 'Frank', 'species' => 'human', 'bounty_value' => 10, 'homeworld' => 'Earth '} )

bounty1.save()
bounty2.save()

binding.pry

nil