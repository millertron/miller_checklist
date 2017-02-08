class ImplementationsController < ApplicationController

	def new
		@checklist = Checklist.find_by_id(params[:checklist_id])
		@checklist_item = @checklist.checklist_items.first
		@implementation = Implementation.new()
		unless (@checklist && @checklist_item)
			flash[:danger] = "Data error - failed to fetch the checklist."
			redirect_to root_path
		end
	end
	
	def create
		@implementation = Implementation.new(implementation_params)
		@implementation.implemented_date = DateTime.new
		if @implementation.save
			redirect_to root_path
		end
	end

	private
	def implementation_params
		params.required(:implementation).permit(:checklist_id)
	end
	
end
