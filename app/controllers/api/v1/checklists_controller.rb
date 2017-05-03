class API::V1::ChecklistsController < API::APIController
	
	before_action :authenticate
	
	def index
		checklists = Checklist.all
		render json: checklists, status: 200
	end
end
