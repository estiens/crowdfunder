require 'spec_helper'

describe "Projects Listing" do 
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
			expect(page).to have_content("Project 1")
			expect(page).to have_content("Project 2")
			expect(page).to have_content("Project 3")
			#click a link to project's show page
			click_link('Project 1')
      # Expect we're on project1's show page

      expect(current_path).to eq(project_path(project1))
      # Expect on this page the first h1 has the text project1's title
      expect(page).to have_selector('h1:first', text: project1.title)
      expect(page).to have_selector('.navbar ul li.active a', text: "Projects")
		end

		it "should display the navigation"  do
			project1 = FactoryGirl.create(:project, :title => 'Project 1')
			
			visit "/"
			expect(current_path).to eq(root_path)
			expect(page).to have_selector('.navbar ul li.active a', text: "Home")

			# click_link "Project 1"
			# expect(page).to have_selector('.navbar ul li.active a', text: "Projects")

			expect(page).to have_selector('.navbar ul li.active a', count: 1)
		end

		it "should have pagination" do 
	      user = FactoryGirl.create :user

	      50.times { |i| FactoryGirl.create(:project, title: "Project #{i}", user: user) }

	      visit "/projects"

	      # Expect the most recently created projects on page 1 (8 PER PAGE)
	    
	      expect(page).to have_content('Project 49')
	     
	      expect(page).to have_no_content('Project 41')

	      expect(page).to have_selector('li.project', count: 8)

	      # Expect pagination link and click page 2
	      page.find('.pagination').click_link '2'

	      # Expect page 2 to have the next 8 projects
	      expect(page).to have_content('Project 41')

	      expect(page).to have_no_content('Project 32')
	  	end
	end
end
