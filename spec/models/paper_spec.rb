require 'rails_helper'

RSpec.describe Paper, type: :model do

  it "should validate title to be present" do
    paper = Paper.new(venue: "HPI, Potsdam, Germany", year: 2003)
    expect(paper).not_to be_valid
  end

end
