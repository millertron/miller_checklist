class AnalyticsController < ApplicationController
	before_action :require_user
	
	@@range_type_options = [:one_week, :two_weeks]
	
	def index
		@user = current_user
		@range_type_options = @@range_type_options
		
	end
	
	def get_summary
		@data = Array.new
		render :partial => "analytics_summary"
	end
	
end
