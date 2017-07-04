namespace :custom_db do
	desc "Update checklist last implemented date"
	task :update_checklist_last_implemented_date => :environment do
		puts "Updating checklists' last implementation date!"
		Checklist.all.each do |checklist|
			checklist.update_last_implemented_date
		end
	end
end