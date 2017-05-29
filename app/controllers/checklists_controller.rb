class ChecklistsController < ApplicationController
	before_action :require_user
	
	@@frequency_options = [:daily, :weekly, :monthly]
	@@value_type_options = [:binary, :metric]
	
	def index
		@user = current_user
		
		@daily_checklists = Checklist.where(owner_id: @user, frequency: :daily)
		@daily_checklists.each do |dc|
			if (!Implementation.where(checklist_id: dc.id, implemented_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).empty?)
				dc.implemented = true
			end
		end
		
		@weekly_checklists = Checklist.where(owner_id: @user, frequency: :weekly)
		@weekly_checklists.each do |wc|
			if (!Implementation.where(checklist_id: wc.id, implemented_date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).empty?)
				wc.implemented = true
			end
		end
		
		@monthly_checklists = Checklist.where(owner_id: @user, frequency: :monthly)
		@monthly_checklists.each do |mc|
			if (!Implementation.where(checklist_id: mc.id, implemented_date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).empty?)
				mc.implemented = true
			end
		end
		
		
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
		params.require(:checklist).permit(:name, :description, :frequency, :checklist_items_attributes => [:id, :text, :value_type, :mandatory, :metric_target_max, :metric_target_min])
	end
end
