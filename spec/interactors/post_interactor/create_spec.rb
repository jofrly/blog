require "rails_helper"

RSpec.describe PostInteractor::Create do
  describe "slug" do
    it "ensures it is set automatically" do
      user = create(:user)
      post_params = { title: "title with multiple words", content: "content" }
      result = PostInteractor::Create.call(user: user, post_params: post_params)
      expect(result.post.slug).to eq("title-with-multiple-words")
    end

    it "sets gets set automatically but skips special characters" do
      user = create(:user)
      post_params = { title: " title with @multiple words!", content: "content" }
      result = PostInteractor::Create.call(user: user, post_params: post_params)
      expect(result.post.slug).to eq("title-with-multiple-words")
    end

    it "can be set manually" do
      user = create(:user)
      post_params = { title: "title with multiple words", content: "content", slug: "title-with-multiple-words" }
      result = PostInteractor::Create.call(user: user, post_params: post_params)
      expect(result.post.slug).to eq("title-with-multiple-words")
    end
  end
end
