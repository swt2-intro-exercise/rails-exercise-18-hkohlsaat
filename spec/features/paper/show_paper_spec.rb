require 'rails_helper'

describe "Show paper page", type: :feature do
  
  it "should show the author's name" do
	author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://de.wikipedia.org/wiki/Alan_Turing")
	author.save!

	paper = Paper.new(title: "Computer science struggling forward", venue: "HPI, Potsdam, Germany", year: 2012)
	paper.authors.append author
	paper.save!

	visit paper_path(paper.id)
    expect(page).to have_text(author.name)
  end

end
