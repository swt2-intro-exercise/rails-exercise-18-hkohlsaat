require 'rails_helper'


describe "Index paper page", type: :feature do
  
  it "should only show papers form the year specified (if a year was specified) with url parameter year" do
	paperA = Paper.new(title: "Paper from the past", venue: "Place in the distance", year: 1950)
	paperA.save!
	paperB = Paper.new(title: "Paper from the future", venue: "Place in the distance", year: 1968)
	paperB.save!

	visit papers_path + "?year=1950"

	expect(page).not_to have_text(paperB.year)
  end

end
