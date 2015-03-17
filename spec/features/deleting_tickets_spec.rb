require 'rails_helper'

feature "Deleting tickets" do
	let!(:project) {FactoryGirl.create(:project)}
	let!(:user) {FactoryGirl.create(:user)}
  	let!(:ticket) { 
    	FactoryGirl.create(:ticket, project: project, user: user)}

	before do 
		visit '/signin'
    	fill_in "Name", with: user.name
    	fill_in "Password", with: user.password
    	click_button 'Sign in'
    	expect(page).to have_content("Signed in successfully.")

		visit "/"
		click_link project.name
		click_link ticket.title
	end

	scenario "Deleting a ticket" do
		click_link "Delete Ticket"

		expect(page).to have_content("Ticket has been deleted.")
 		expect(page.current_url).to eq(project_url(project))
	end
end