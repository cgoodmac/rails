# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CreatureType.delete_all
Creature.delete_all
Message.delete_all

ct1 = CreatureType.create(:name => "Alien")
ct2 = CreatureType.create(:name => "Predator")
ct3 = CreatureType.create(:name => "Godzilla")
ct4 = CreatureType.create(:name => "Medusa")

creature_types = [ct1, ct2, ct3, ct4]
weapons = ['knife', 'gun', 'boomerang', 'magic', 'mace']

('A'..'Z').each do |letter|
  c = Creature.create(:creature_type => creature_types.sample, :name => letter, :weapon => weapons.sample, :password => 'a', :password_confirmation => 'a')
end

25.times do |x|
  Message.create(:message_text => 10.sentences, :sender_id => Creature.all.sample.id, :receiver_id => Creature.all.sample.id)
end