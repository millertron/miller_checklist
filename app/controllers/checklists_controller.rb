class ChecklistsController < ApplicationController
	before_action :require_user
	
	def index
		@user = current_user
		@checklists = Checklist.all
	end
	
	def new
		@user = current_user
		@checklist = Checklist.new
	end
	
	def create
		@checklist = Checklist.new(checklist_params)
		puts "New Checklist: "
		puts "Name: #{@checklist.name}"
		puts "Description: #{@checklist.description}"
		puts "Owner: #{@checklist.owner_id}"
		if @checklist.save then
			puts "Save checklist!"
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
		
		params.require(:checklist).permit(:name, :description, {:owner_id=>User.first.id})
	end
end
