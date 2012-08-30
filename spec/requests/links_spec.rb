require 'spec_helper'

describe "Links" do
  it "clicks a link to go to a page" do
    visit root_path
    Artist.all.each do |artist|
      click_link artist.name
    end
  end
end

