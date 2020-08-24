# users
admin_user = User.new(email: "admin@operationfaceshieldchicago.com",
			    password: "password",
			    password_confirmation: "password",
			    admin: true)
admin_user.confirm
admin_user.save!

#user_two = User.new(email: "armiger2@uic.edu",
					password: "password",
					password_confirmation: "password")
#user_two.confirm
#user_two.save

#user_three = User.new(email: "jointpainjames@gmail.com",
					password: "password",
					password_confirmation: "password")
#user_three.confirm
#user_three.save

#no_account_user = User.new(email: "no_account@chasseur.fr",
						   password: "password",
						   password_confirmation: "password")
#no_account_user.confirm
#no_account_user.save

# accounts

#account_two = Account.new(institution_name: "Pirouette Hospital",
						  institution_type: "Medical",
						  contact_first_name: "Olivier",
						  contact_last_name: "Rousteing",
						  phone_number: 2214548899,
						  user_id: user_two.id)
#account_two.save

#account_three = Account.new(institution_name: "Pierrot Medical",
						  institution_type: "Medical",
						  contact_first_name: "Pierrot",
						  contact_last_name: "Dumbledore",
						  phone_number: 1114321111,
						  user_id: user_three.id)
#account_three.save

# addresses
=begin
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
=end
# orders
=begin
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
=end
# articles

Article.create(url: "https://www.mlive.com/news/ann-arbor/2020/04/ann-arbor-pilot-flies-face-shields-to-health-care-workers-around-midwest-to-help-fight-coronavirus.html",
	           title: "Ann Arbor pilot flies face shields to health care workers around Midwest to help fight coronavirus",
	           img_src: "https://www.mlive.com/resizer/pi5sJoct9HKX6S83xYFHWAF1saI=/700x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/4VENGY2KRBBKRKAEXBCLQNF3IQ.JPG")

Article.create(url: "https://womc.radio.com/blogs/jj-and-joanne-mornings/local-pilot-delivers-face-shields-to-remote-hospitals",
	           title: "Community Creates Face Shields & Local Pilot Delivers Them To Remote Midwest Hospitals",
	           img_src: "https://images.radio.com/womcfm/60780240498__A526EFED-D476-4D8E-9ED8-5EA05F28D994.JPG?width=775&height=515&crop=775:515,smart")

Article.create(url: "https://www.mlive.com/news/grand-rapids/2020/04/ann-arbor-group-gathers-hundreds-of-3d-printed-face-shields-for-health-care-workers.html",
	           title: "Ann Arbor group gathers hundreds of 3D-printed face shields for health care workers",
	           img_src: "https://www.mlive.com/resizer/wf9xFvmSRgmug1GXE84bTLOuRf4=/700x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/AFG65V2AERAUTKMUR4Z4JSYUJI.JPG")

Article.create(url: "https://www.weloveannarbor.com/2020/04/16/operation-face-shield-ann-arbor-provides-10000-shields-for-medical-professionals/?fbclid=IwAR3JeIVULj3hUY9_C8QztBiVxqZFlEjWgTIMHdkDOWSDNyRq4fWp3AaDrio",
	           title: "“Operation Face Shield — Ann Arbor” Provides 10,000 Shields For Medical Professionals",
	           img_src: "https://www.weloveannarbor.com/wp-content/uploads/2020/04/IMG_5416-1536x1055.jpg")

Article.create(url: "https://www.clickondetroit.com/all-about-ann-arbor/2020/04/01/operation-face-shield-ann-arbor-receives-exponential-donations/",
	           title: "Operation Face Shield Ann Arbor receives ‘exponential’ donations",
	           img_src: "https://www.clickondetroit.com/resizer/BO_tbusmzYdJNOBWm1bVHTKcMH0=/1440x800/smart/filters:format(jpeg):strip_exif(true):strip_icc(true):no_upscale(true):quality(65)/arc-anglerfish-arc2-prod-gmg.s3.amazonaws.com/public/KBVLHUJG4RFGDCIJCWBYNST7SU.jpg")

Article.create(url: "https://www.freep.com/story/news/education/2020/04/02/coronavirus-covid-19-ann-arbor-face-shields-3-d-printers/5094460002/",
	           title: "Ann Arbor teachers, students use 3D printing to make face shields for health care workers",
	           img_src: "https://www.gannett-cdn.com/presto/2020/03/26/PDTF/6de3a2a4-e000-4a62-9818-57c58094871b-03252020_a2faceshield_jh__0_3.jpg?width=1320&height=881&format=pjpg&auto=webp")

Article.create(url: "https://www.mlive.com/news/ann-arbor/2020/03/ann-arbor-teachers-community-make-face-shields-for-healthcare-workers-to-protect-against-coronavirus.html",
	           title: "Ann Arbor teachers, community make face shields for healthcare workers to protect against coronavirus",
	           img_src: "https://www.mlive.com/resizer/TWpLOTb_UArY_T2gCE2dApGRIrQ=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/OX3BJTCQHFBBPF5Z4EB3YHLYAU.jpg")

Article.create(url: "https://www.michigandaily.com/section/ann-arbor/ann-arbor-residents-create-face-shields-medical-professionals-front-lines",
	           title: "Ann Arbor residents create face shields for medical professionals on the front lines",
	           img_src: "https://www.michigandaily.com/sites/default/files/styles/large/public/200408/unnamed.png?itok=es1269KF")

Article.create(url: "https://www.dbusiness.com/daily-news/businesses-community-partners-make-face-shields-using-design-from-ann-arbors-u-m/",
	           title: "Businesses, Community Partners Make Face Shields Using Design from Ann Arbor’s U-M",
	           img_src: "https://cdn.dbusiness.com/wp-content/uploads/sites/33/2020/04/U-M-face-shields.jpg")

Article.create(url: "https://www.wired.com/story/youre-not-alone-how-one-nurse-is-confronting-pandemic/",
	           title: "‘You’re Not Alone’: How One Nurse Is Confronting the Pandemic",
	           img_src: "https://media.wired.com/photos/5ebf2cfbda42f39db947dfaa/master/w_1024%2Cc_limit/Backchannel-Hospital-3_405.jpg")


