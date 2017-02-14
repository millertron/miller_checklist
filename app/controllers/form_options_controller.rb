class FormOptionsController < ApplicationController
	before_action :require_user
	
	def index
		@form_option = FormOption.new
		@context_list = FormOption.distinct.pluck(:context)
	end
	
	def create
		@form_option = FormOption.new(form_option_params)
		if (@form_option.save)
			redirect_to root_path
		end
	end
	
	def search
		@context = params[:searchText]
		@form_options = FormOption.where(context: @context)
		
		render :partial => "form_options_table"
	end
	
	def destroy
		FormOption.find(params[:id]).destroy
	end
	
	private
	def form_option_params
		params.require(:form_option).permit(:context, :text_value, :seq)
	end
end
