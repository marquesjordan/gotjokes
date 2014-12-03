FactoryGirl.define do


   #we define a factory name, and then we specify the class
  factory :a_profile, class: Profile do

    #these setup the attributes, each declaration is a method call
    name "zach"
    location "santa monica"
    bio "I like to dance"
	videos "yes"
	pictures "yes"
	end  
end


