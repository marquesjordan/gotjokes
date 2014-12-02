FactoryGirl.define do


  #we define a factory name, and then we specify the class
  factory :a_user, class: User do

    #these setup the attributes, each declaration is a method call
    email "x@y.com"
    password "gemini"
    username "zach"

  end
end
