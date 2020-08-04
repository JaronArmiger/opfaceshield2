# users
admin_user = User.new(email: "test@test.com",
			    password: "password",
			    password_confirmation: "password",
			    admin: true)
#admin_user.confirm
admin_user.save!

user_two = User.new(email: "hombre@masculinida",
					password: "password",
					password_confirmation: "password")
#user_two.confirm
user_two.save

user_three = User.new(email: "loic@pri.gent",
					password: "password",
					password_confirmation: "password")
#user_three.confirm
user_three.save

no_account_user = User.new(email: "no_account@chasseur.fr",
						   password: "password",
						   password_confirmation: "password")
#no_account_user.confirm
no_account_user.save

# accounts

account_two = Account.new(institution_name: "Pirouette Hospital",
						  institution_type: "Medical",
						  contact_first_name: "Olivier",
						  contact_last_name: "Rousteing",
						  phone_number: 2214548899,
						  user_id: user_two.id)
account_two.save

account_three = Account.new(institution_name: "Pierrot Medical",
						  institution_type: "Medical",
						  contact_first_name: "Pierrot",
						  contact_last_name: "Dumbledore",
						  phone_number: 1114321111,
						  user_id: user_three.id)
account_three.save

# addresses

street_address_two = "5 W Anderson Ln"
city_two = "Djeraak"
state_two = "Hisendower"
zipcode_two = 99221

address_two = Address.new(street_address: street_address_two,
						  city: city_two,
						  state: state_two,
						  zipcode: zipcode_two,
						  account_id: account_two.id)
address_two.save

street_address_three = "17 N Gloom Rd"
city_three = "Yootri"
state_three = "Durminsaverrin"
zipcode_three = 89881

address_three = Address.new(street_address: street_address_three,
						    city: city_three,
						    state: state_three,
						    zipcode: zipcode_three,
						    account_id: account_three.id)
address_three.save

# orders

10.times do
	order = Order.new(num_shields: 121,
				  	  num_adjusters: 232,
				  	  message: "parce que je suis une infirmiere",
				  	  street_address: street_address_two,
				  	  city: city_two,
				  	  state: state_two,
				  	  zipcode: zipcode_two,
				  	  account_id: account_two.id)
	order.save
end

10.times do
	order = Order.new(num_shields: 555,
				  	  num_adjusters: 219,
				  	  message: "parce que t'es un connard",
				  	  street_address: street_address_three,
				  	  city: city_three,
				  	  state: state_three,
				  	  zipcode: zipcode_three,
				  	  account_id: account_three.id)
	order.save
end


