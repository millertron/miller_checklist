class AnalyticsController < ApplicationController
	before_action :require_user
	
	@@range_type_options = [:one_week, :two_weeks]
	
	def index
		@user = current_user
		@range_type_options = @@range_type_options
		
	end
	
	def get_summary
		#Returns random data at the moment to play around, move to use checklist data when data visualization design has been completed.
		@data = Array.new
		(1..5).each do |i|
			score = rand(0..100)
			
			if score >= 50
				progress_class = "success"
			else
				progress_class = "warning"
			end
			
			@data << SummaryData.new("Checklist #{i}", progress_class, score)
		end
		render :partial => "analytics_summary"
	end
	
end
