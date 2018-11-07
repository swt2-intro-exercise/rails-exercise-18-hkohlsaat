require 'rails_helper'

RSpec.describe Author, type: :model do

  it "should give both first and last name in the (full) name" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://de.wikipedia.org/wiki/Alan_Turing")
    expect(author.name).to eq("Alan Turing")
  end

end
