require 'rails_helper'

RSpec.describe "MainStyles", type: :request do

  describe "TEST FOR STYLES OF CITE" do

    describe "test main links of site" do
    visit root_path
    expect(page).to have_content('Sign in')
    end
  end
  end
