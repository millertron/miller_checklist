class API::V1::ChecklistsController < API::APIController
	
	before_action :authenticate
	
	def index
		if (params[:owner_id])
			checklists = Checklist.where(owner_id: params[:owner_id])
			render json: checklists, status: :ok
		else
			render json: 'Missing parameter: owner_id', status: :unprocessable_entity
		end
	end
end
