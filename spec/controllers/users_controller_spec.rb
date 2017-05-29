require 'rails_helper'

describe UsersController, :type => :controller do
	
	let(:other_user){ FactoryGirl.create(:user, :status => :active) }
	let(:new_user_username){ "new_user_for_test" }
	let(:new_user_params){ {user: {username: new_user_username, first_name: "First", last_name: "Last", email: "newtestuser@email.com", password: "password123"}} } 
	
	context "when not logged in" do
		describe "GET #new" do
			before { get :new }
			it "should return success" do
				expect(response).to have_http_status(:ok)
			end
			it "should render sign-up page" do
				expect(response).to render_template("new")
			end
		end
		
		describe "POST #create" do
			before { post :create, params: new_user_params }
			it "should create a pre-active user" do
				new_user = User.find_by(username: new_user_username)
				expect(new_user).to_not be_nil
				expect(new_user.preactive_status?).to eq true
			end
			it "should redirect me to the login page" do
				expect(response).to redirect_to root_path
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
			before { get :index, params: {:id => other_user.id} }
			it "should return unauthorized response" do
				expect(response).to render_template("unauthorized")
			end
			it "should render unauthorized page" do
				expect(response).to have_http_status(:unauthorized)
			end
		end
		
		describe "POST #update" do
		
		end
		
		describe "POST #destroy" do
		
		end
	end
	
	context "when logged in" do
		before do
			session[:user_id] = user.id	
		end
			
		context "as basic user" do
			let(:user){ FactoryGirl.create(:user, :status => :active) }
			describe "GET #index" do
				before { get :index }
				it "should return unauthorized response" do
					expect(response).to render_template("unauthorized")
				end
				it "should render unauthorized page" do
					expect(response).to have_http_status(:unauthorized)
				end	
			end
		
			describe "GET #new" do
				before { get :new }
				it "should return unauthorized response" do
					expect(response).to render_template("unauthorized")
				end
				it "should render unauthorized page" do
					expect(response).to have_http_status(:unauthorized)
				end
			end
			
			describe "POST #create" do
			
			end
			
			context "GET #edit" do
				describe "myself" do
					before { get :edit, params: {:id => user.id} }
					it "should return success" do
						expect(response).to have_http_status(:ok)
					end
					it "should render edit page" do
						expect(response).to render_template("edit")
					end
				end
				describe "someone else" do
					before { get :edit, params: {:id => other_user.id} }
					it "should return unauthorized response" do
						expect(response).to render_template("unauthorized")
					end
					it "should render unauthorized page" do
						expect(response).to have_http_status(:unauthorized)
					end
				end
			end
			
			describe "POST #update" do
			
			end
			
			describe "POST #destroy" do
			
			end
		end
		
		context "as admin user" do
			let(:user){ FactoryGirl.create(:user, :status => :active, :admin => true) }
			describe "GET #index" do
				before { get :index }
				it "should return success" do
					expect(response).to have_http_status(:ok)
				end
				it "should render index page" do
					expect(response).to render_template("index")
				end
			end
			
			describe "GET #new" do
			
			end
			
			describe "POST #create" do
			
			end
			
			describe "GET #index" do
			
			end
			
			describe "GET #edit" do
				describe "myself" do
					before { get :edit, params: {:id => user.id} }
					it "should return success" do
						expect(response).to have_http_status(:ok)
					end
					it "should render edit page" do
						expect(response).to render_template("edit")
					end
				end
				describe "someone else" do
					before { get :edit, params: {:id => other_user.id} }
					it "should return success" do
						expect(response).to have_http_status(:ok)
					end
					it "should render edit page" do
						expect(response).to render_template("edit")
					end
				end
			end
			
			describe "POST #update" do
			
			end
			
			describe "POST #destroy" do
			
			end
		end
	
	end

end