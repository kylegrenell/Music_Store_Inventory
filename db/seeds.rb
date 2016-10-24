require ('pry-byebug')
require_relative ('../models/customer')
require_relative ('../models/instrument')
require_relative ('../models/sale')

Instrument.delete_all()
Customer.delete_all()
Sale.delete_all()


guitar1 = Instrument.new({'brand' => "Fender 52 Reissue", 'type' => "Electric Guitar", 'cost' => 1499, 'quantity' => 10})
guitar1.save()
guitar2 = Instrument.new({'brand' => "Fender Stratocaster", 'type' => "Electric Guitar", 'cost' => 499, 'quantity' => 10})
guitar2.save()
guitar3 = Instrument.new({'brand' => "Gibson ES-335", 'type' => "Electric Guitar", 'cost' => 2999, 'quantity' => 5})
guitar3.save()
guitar4 = Instrument.new({'brand' => "Epiphone Dot 335", 'type' => "Electric Guitar", 'cost' => 349, 'quantity' => 15})
guitar4.save()
guitar5 = Instrument.new({'brand' => "Gretsch G2420 Streamliner", 'type' => "Electric Guitar", 'cost' => 364, 'quantity' => 15})
guitar5.save()
guitar6 = Instrument.new({'brand' => "Fender Jag-Stang ", 'type' => "Electric Guitar", 'cost' => 549, 'quantity' => 10})
guitar6.save()
guitar7 = Instrument.new({'brand' => "Rick Nielsen’s Five-Neck Hamer", 'type' => "Electric Guitar", 'cost' => 5000, 'quantity' => 3})
guitar7.save()
guitar8 = Instrument.new({'brand' => "Fender Duo Sonic", 'type' => "Electric Guitar", 'cost' => 488, 'quantity' => 15})
guitar8.save()
guitar9 = Instrument.new({'brand' => "Yamaha F310", 'type' => "Acoustic Guitar", 'cost' => 149, 'quantity' => 20})
guitar9.save()
guitar10 = Instrument.new({'brand' => "Alhambra Crossover CS-3 CW E5", 'type' => "Acoustic Guitar", 'cost' => 999, 'quantity' => 10})
guitar10.save()
bass1 = Instrument.new({'brand' => "Fender Deluxe Active P Special", 'type' => "Bass", 'cost' => 785, 'quantity' => 10})
bass1.save()
bass2 = Instrument.new({'brand' => "Sterling by Music Man", 'type' => "Bass", 'cost' => 799, 'quantity' => 10})
bass2.save()
bass3 = Instrument.new({'brand' => "Yamaha BB Series BB424", 'type' => "Bass", 'cost' => 399, 'quantity' => 15})
bass3.save()
bass4 = Instrument.new({'brand' => "Epiphone Goth Thunderbird VI", 'type' => "Bass", 'cost' => 299, 'quantity' => 15})
bass4.save()
bass5 = Instrument.new({'brand' => "Ibanez GSR200", 'type' => "Bass", 'cost' => 199, 'quantity' => 20})
bass5.save()
kit1 = Instrument.new({'brand' => "Ludwig Club Date ", 'type' => "Drums", 'cost' => 925, 'quantity' => 5})
kit1.save()
kit2 = Instrument.new({'brand' => "Gretsch Catalina", 'type' => "Drums", 'cost' => 800, 'quantity' => 6})
kit2.save()
kit3 = Instrument.new({'brand' => "Pearl Export Series", 'type' => "Drums", 'cost' => 785, 'quantity' => 7})
kit3.save()

customer1 = Customer.new({'name' => 'Moe', 'address' => '21 Stooge Street, Edinburgh', 'funds' => 2000})
customer1.save()
customer2 = Customer.new({'name' => 'Larry', 'address' => '23 Stooge Street, Edinburgh', 'funds' => 3000})
customer2.save()
customer3 = Customer.new({'name' => 'Curly', 'address' => '25 Stooge Street, Edinburgh', 'funds' => 4000})
customer3.save()

sale1 = Sale.new({'customer_id' => customer1.id, 'instrument_id' => guitar1.id})
sale1.save()
sale2 = Sale.new({'customer_id' => customer2.id, 'instrument_id' => guitar3.id})
sale2.save()
sale3 = Sale.new({'customer_id' => customer3.id, 'instrument_id' => kit1.id})
sale3.save()
sale4 = Sale.new({'customer_id' => customer1.id, 'instrument_id' => bass1.id})
sale4.save()
sale5 = Sale.new({'customer_id' => customer2.id, 'instrument_id' => guitar7.id})
sale5.save()

binding.pry
nil
