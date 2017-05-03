class API::V1::ImplementationsController < API::APIController

	before_action :authenticate

	def create
		checklist = Checklist.find(params[:implementation][:checklist_id])
		
		implementation = Implementation.where(checklist_id: checklist.id, implemented_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).last if checklist.frequency == "daily"
		implementation = Implementation.where(checklist_id: checklist.id, implemented_date: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).last if checklist.frequency == "weekly"
		implementation = Implementation.where(checklist_id: checklist.id, implemented_date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).last if checklist.frequency == "monthly"
		
		if implementation
			render json: implementation, status: :ok
		else
			implementation = Implementation.new(implementation_params)
			implementation.implemented_date = DateTime.now
			if implementation.save
				render json: implementation, status: :created, location: implementation
			end
		end
	end

	private
	def implementation_params
		params.required(:implementation).permit(:implementor_id, :checklist_id, :implementation_items_attributes => [:text, :binary_value, :metric_value, :metric_target_max, :metric_target_min])
	end
end
