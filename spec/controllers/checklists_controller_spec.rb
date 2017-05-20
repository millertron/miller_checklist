require 'rails_helper'

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

	context "with user logged in" do
		let(:user){FactoryGirl.create(:user, :status => :active )}
		let(:checklist){FactoryGirl.create(:checklist, :owner => :user)}
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
		
		
		describe "GET #edit" do
			let(:someone){FactoryGirl.create(:user, :status => :active )}
			let(:checklist){FactoryGirl.create(:checklist, :owner => :someone)}
		
			context "a checklist that doesn't belong to me" do
				it "should redirect me to error message page" do
					#expect(controller).to_not receive(:edit)
					#expect(response).to redirect_to error_path
				end
			end
		end
		
		describe "POST #update" do
			context "a checklist that doesn't belong to me" do
			
			end
		end
		
	end
	
end