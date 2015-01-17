require 'spec_helper'

describe "Viewing the list of forms" do

  it "shows the forms" do
    visit 'http://example.com/forms'

    expect(page).to have_text("2015 Forms")
  end

end