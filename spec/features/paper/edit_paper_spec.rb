require 'rails_helper'

describe "Edit paper page", type: :feature do
	
	it "should have a single multiple select box" do
		paper = Paper.new(title: "Computer science struggling forward", venue: "HPI, Potsdam, Germany", year: 2012)
		paper.save!

		visit edit_paper_path(paper.id)

    	expect(page).to have_selector('select[multiple]')
	end

	it "should affect the authors' data when submitted" do
		author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://de.wikipedia.org/wiki/Alan_Turing")
		author.save!

		paper = Paper.new(title: "Computer science struggling forward", venue: "HPI, Potsdam, Germany", year: 2012)
		paper.authors.append author
		paper.save!

		peter = Author.new(first_name: "Peter", last_name: "Plagiarist", homepage: "http://www.gutenberg.org/")
		peter.save!

		visit edit_paper_path(paper.id)

		select peter.name, from: 'paper[author_ids][]'
		click_button 'Update Paper'

		authors_ids = Paper.find(paper.id).authors.map{ |a| a.id }
		expect(authors_ids).to include(author.id, peter.id)
	end

end