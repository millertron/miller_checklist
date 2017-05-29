require 'rails_helper'

describe UsersController, :type => :controller do

	context "when not logged in" do
		describe "GET #new" do
			it "will take me to the sign-up page" do
			
			end
		end
		
		describe "POST #create" do
			it "will create a pre-active user" do
			
			end
		end
		
		describe "GET #index" do
			before { get :index }
			
			it "should return unauthorized response" do
				expect(response).to render_template("unauthorized")
			end
			it "should render unauthorized page" do
				expect(response).to have_http_status(:unauthorized)
			end
		end
		
		describe "GET #edit" do
		
		end
		
		describe "POST #update" do
		
		end
		
		describe "POST #destroy" do
		
		end
	end
	
	context "when logged in" do
		context "as basic user" do
			describe "GET #new" do
				
			end
			
			describe "POST #create" do
			
			end
			
			describe "GET #index" do
			
			end
			
			describe "GET #edit" do
			
			end
			
			describe "POST #update" do
			
			end
			
			describe "POST #destroy" do
			
			end
		end
		
		context "as admin user" do
			describe "GET #new" do
		
			end
			
			describe "POST #create" do
			
			end
			
			describe "GET #index" do
			
			end
			
			describe "GET #edit" do
			
			end
			
			describe "POST #update" do
			
			end
			
			describe "POST #destroy" do
			
			end
		end
	
	end

end