require 'rails_helper'

RSpec.describe "Guest cannot create blog post" do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    visit new_blog_post_path
    expect(current_path).to eq(root_path)
  end
end
