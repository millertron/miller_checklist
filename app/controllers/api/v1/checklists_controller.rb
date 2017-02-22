class Api::V1::ChecklistsController < Api::ApiController
	
	before_action :authenticate
	
	def index
		@checklists = Checklist.all
		respond_to do |format|
			format.json { render(json: @checklists) }
		end
	end
end
