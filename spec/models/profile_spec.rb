require 'rails_helper'
require 'spec_helper'

describe Profile do
 it "has valid factory" do
 	  FactoryGirl.create(:profile).should be_valid
 end

 it "is invalid without user id" do
  profile = FactoryGirl.build(:profile, user_id: nil)
  expect(profile).to be_invalid
 end

 it "is valid without address" do
   profile = FactoryGirl.build(:profile, address: nil)
   expect(profile).to be_valid
 end

 it "is valid without contact "do 
  profile = FactoryGirl.build(:profile, contact: nil)
  expect(profile).to be_valid
 end

 it "is valid without qualification " do 
 	profile = FactoryGirl.build(:profile,qualification: nil)
  expect(profile).to be_valid
 end

 it "is valid without date of birth" do
  profile = FactoryGirl.build(:profile, dob: nil)
  expect(profile).to be_valid
 end

 it "is valid without gender " do
  profile = FactoryGirl.build(:profile, gender: nil)
  expect(profile).to be_valid
 end
end
