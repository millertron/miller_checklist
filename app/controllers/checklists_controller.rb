class ChecklistsController < ApplicationController
	before_action :require_user
	
	def index
		@user = current_user
		@checklists = Checklist.where(owner_id: @user.id)
	end
	
	def new
		@user = current_user
		@checklist = Checklist.new
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
		
		params.require(:checklist).permit(:name, :description)
	end
end
