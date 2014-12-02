require "rails_helper"

describe Profile do


    it "has a name" do
      #now use FactoryGirl to build a user
      profile = FactoryGirl.build_stubbed(:a_profile)
      expect(profile.name).to_not be_nil  
    end

    it "has a location" do
      profile = FactoryGirl.build_stubbed(:a_profile)
      expect(profile.location).to_not be_nil
    end

    it "has a bio" do
      profile = FactoryGirl.build_stubbed(:a_profile)
      expect(profile.bio).to_not be_nil
    end

    it "has videos" do
      profile = FactoryGirl.build_stubbed(:a_profile)
      expect(profile.videos).to_not be_nil
    end

    it "has a picture" do
      profile = FactoryGirl.build_stubbed(:a_profile)
      expect(profile.picture).to_not be_nil
    end



end
