class API::V1::ChecklistsController < API::APIController
	
	before_action :authenticate, except: :index
	
	def index
		puts "API GET request for checklists!"
		checklists = Checklist.all
		render json: checklists, status: 200
	end
end
