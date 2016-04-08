require 'rails_helper'
# require 'spec_helper'
describe ProfilesController do
  describe "GET #index" do
  	it "populates any array of profiles" do
  	user = FactoryGirl.create(:user)
    get :index
    assigns(:user).should eql?([user])
    end

    it "renders the :index view" do
    get :index
    response.should render_template :index
    end	
  end


  describe "GET #show" do
    it "assigns the requested profile to @profile" do
      profile = FactoryGirl.create(:profile)
      get :show, id: profile
      assigns(:profile).should eql?(profile)
    end

    it "renders the #show view" do
     get :show, id: FactoryGirl.create(:profile) 
     response.should render_template :show
    end
  end
  
  describe "GET #new" do
    it "assigns a new profile to @profile"
    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new profile in the database"
      it "redirects to the home page"
    end
  end
end
