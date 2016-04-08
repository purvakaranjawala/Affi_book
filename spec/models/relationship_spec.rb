require 'rails_helper'

RSpec.describe Relationship, type: :model do
 
 it "has valid factory" do
 	  FactoryGirl.create(:relationship).should be_valid
 end

 it "is invalid without followed_id" do
  FactoryGirl.build(:relationship, followed_id: 1).should_not be_valid 
 end

 it "is valid without follower_id" do
   FactoryGirl.build(:relationship, follower_id: 1).should_not be_valid
 end

 it "is valid without user_id" do
   FactoryGirl.build(:relationship, user_id: nil).should_not be_valid
 end
end
