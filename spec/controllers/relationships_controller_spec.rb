require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  describe "GET #index" do
    it "populates an array of relationships" do
    # @relationship = FactoryGirl.create(:relationship,:user => current_user)    
    @relationship = let(:user) { FactoryGirl.create(:user) }
    get :index, {}, valid_session
    assigns(:relationship).should eql?([@relationship])
    end

    it "renders the :index view" do
    get :index
   expect(response).to render_template("index")
    # response.should render_template :index
    end
  end



  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "creates a new relationship" do
  #       expect{
  #         post :create, relationship: FactoryGirl.attributes_for(:relationship)
  #       }.to change(relationship,:count).by(1)
  #     end
  #     it "redirects to the new relationship" do
  #       post :create, relationship: FactoryGirl.attributes_for(:relationship)
  #       response.should redirect_to relationship.last
  #     end
  #   end  

  #   context "with invalid attributes" do
  #     it "does not save the new relationship" do
  #       expect{
  #       post :create, relationship: FactoryGirl.attributes_for(:invalid_relationship)
  #       }.to_not change(relationship,:count)
  #     end

  #     it "re-renders the new method" do
        
  #     end  
  #   end 
  # end 

  

end
