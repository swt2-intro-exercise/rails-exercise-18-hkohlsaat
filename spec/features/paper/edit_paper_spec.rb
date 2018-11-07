require 'rails_helper'

describe "Edit paper page", type: :feature do
	
	it "should have a single multiple select box" do
		paper = Paper.new(title: "Computer science struggling forward", venue: "HPI, Potsdam, Germany", year: 2012)
		paper.save!

		visit edit_paper_path(paper.id)

    	expect(page).to have_selector('select[multiple]')
	end

end