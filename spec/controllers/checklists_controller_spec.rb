require 'spec_helper'

describe ChecklistsController, :type => :controller do
	
	context "with no user logged in" do
		describe "GET #new" do
			it "redirects to login page" do
				get :new
				expect(controller).to_not receive(:new)
				expect(response).to redirect_to login_path 
			end
		end
	end

	context "user logged in" do
		let(:user){FactoryGirl.create(:user, :status => :active )}
			
		before do
			session[:user_id] = user.id	
		end
		
		describe "GET #new" do
			it "renders a page for new checklists creation" do
				get :new
				expect(response).to be_success
				expect(response).to render_template("checklists/new")
			end
		end
	
	end
	
end