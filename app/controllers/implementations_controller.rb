class ImplementationsController < ApplicationController
	before_action :require_user

	def new
		@checklist = Checklist.find_by_id(params[:checklist_id])
		@checklist_items = @checklist.checklist_items
		@implementation = Implementation.new()
		@implementation.implementation_items << ImplementationItem.new
		unless (@checklist)
			flash[:danger] = "Data error - failed to fetch the checklist."
			redirect_to root_path
		end
	end
	
	def create
		@implementation = Implementation.new(implementation_params)
		@implementation.implemented_date = DateTime.now
		@implementation.implementor = current_user
		if @implementation.save
			@implementation.notify_checklist
			redirect_to root_path
		end
	end

	private
	def implementation_params
		params.required(:implementation).permit(:checklist_id, :implementation_items_attributes => [:text, :binary_value, :metric_value, :metric_target_max, :metric_target_min])
	end
	
end
