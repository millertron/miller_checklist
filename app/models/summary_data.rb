class SummaryData
	attr_accessor :checklist_name, :progress_class, :score
	
	def initialize checklist_name, progress_class, score
		@checklist_name = checklist_name
		@progress_class = progress_class
		@score = score
	end
end