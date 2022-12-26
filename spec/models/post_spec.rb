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

  context "slug" do
    it "gets generated automatically by the title" do
      post = create(:post, title: "Just some test title", slug: "")
      expect(post.slug).to eq("just-some-test-title")
    end

    it "gets generated uniquely" do
      first_post = create(:post, title: "Just some test title")
      expect(first_post.slug).to eq("just-some-test-title")

      second_post = create(:post, title: "Just some test title")
      expect(second_post.slug).to match("just-some-test-title-")
    end

    it "can be set manually" do
      post = create(:post, slug: "a-manually-set-slug")
      expect(post.slug).to eq("a-manually-set-slug")
    end

    it "gets parameterized when set manually" do
      post = create(:post, slug: "a manually Set slug")
      expect(post.slug).to eq("a-manually-set-slug")
    end
  end

  context "#content_preview" do
    it "truncates at 350 characters" do
      post = build(:post, content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

      expect(post.content_preview).to eq("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur si...")
    end
  end
end
