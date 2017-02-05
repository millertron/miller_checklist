class ChecklistsController < ApplicationController
	before_action :require_user
	
	@@frequency_options = [:daily, :weekly, :monthly]
	@@value_type_options = [:binary]
	
	def index
		@user = current_user
		
		@daily_checklists = Checklist.where(owner_id: @user, frequency: :daily)
		@weekly_checklists = Checklist.where(owner_id: @user, frequency: :weekly)
		@monthly_checklists = Checklist.where(owner_id: @user, frequency: :monthly)
		
		@checklists = Checklist.where(owner_id: @user.id)
		
	end
	
	def new
		@user = current_user
		@checklist = Checklist.new
		@frequency_options = @@frequency_options
		@value_type_options = @@value_type_options
		@checklist.checklist_items << ChecklistItem.new
	end
	
	def create
		@checklist = Checklist.new(checklist_params)
		@checklist.owner_id = current_user.id
		if @checklist.save then
			redirect_to checklists_path
		end
	end
	
	def edit
		@user = current_user
		@checklist = Checklist.find(params[:id])
		@frequency_options = @@frequency_options
		@value_type_options = @@value_type_options
	end
	
	def update
		@checklist = Checklist.find(params[:id])
		if (@checklist.update_attributes(checklist_params))
			redirect_to checklists_path
		end
	end
	
	def destroy
		@checklist = Checklist.find(params[:id]).destroy
		redirect_to checklists_path
	end
	
	private
	def checklist_params	
		params.require(:checklist).permit(:name, :description, :frequency, :checklist_items_attributes => [:id, :text, :value_type])
	end
end
