require 'spec_helper'

describe "Project Listing" do 
	describe "when visiting the index page" do
		it "should display all projects" do
			# create 3 projects
			project1 = FactoryGirl.create(:project, :title => 'Project 1')
			project2 = FactoryGirl.create(:project, :title => 'Project 2')
			project3 = FactoryGirl.create(:project, :title => 'Project 3')

			# got to the page with the projects
			visit "/projects"

			expect(current_path).to eq(projects_path)

			expect(page).to have_content("Listing projects")
			expect(page).to have_content("project 1")
			expect(page).to have_content("project 2")
			expect(page).to have_content("project 3")
		end
	end
end