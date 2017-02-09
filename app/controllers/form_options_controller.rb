class FormOptionsController < ApplicationController
	def index
		@form_option = FormOption.new
	end
	
	def create
		@form_option = FormOption.new(form_option_params)
		if (@form_option.save)
			redirect_to root_path
		end
	end
	
	private
	def form_option_params
		params.require(:form_option).permit(:context, :text_value, :seq)
	end
end