require "rails_helper"

describe User do

    it "has an email" do
      #now use FactoryGirl to build a user
      user = FactoryGirl.build_stubbed(:a_user)
      expect(user.email).to_not be_nil  
    end

    it "has a password" do
      user = FactoryGirl.build_stubbed(:a_user)
      expect(user.password).to_not be_nil
    end

    it "has a username" do
      user = FactoryGirl.build_stubbed(:a_user)
      expect(user.username).to_not be_nil
    end

end




