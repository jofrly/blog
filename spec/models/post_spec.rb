require "rails_helper"

RSpec.describe Post do
  context "title" do
    it "is required" do
      post = build(:post, title: nil)
      expect(post.valid?).to be_falsey
      expect(post.errors.full_messages.first).to eq("Titel muss ausgefüllt werden")
    end
  end

  context "content" do
    it "is required" do
      post = build(:post, content: nil)
      expect(post.valid?).to be_falsey
      expect(post.errors.full_messages.first).to eq("Inhalt muss ausgefüllt werden")
    end
  end
end
