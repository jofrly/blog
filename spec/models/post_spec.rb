require 'rails_helper'

RSpec.describe Post do
  context 'title' do
    it 'is required' do
      post = build(:post, title: nil)
      expect(post).not_to be_valid
      expect(post.errors.full_messages.first).to eq('Titel muss ausgefüllt werden')
    end
  end

  context 'content' do
    it 'is required' do
      post = build(:post, content: nil)
      expect(post).not_to be_valid
      expect(post.errors.full_messages.first).to eq('Inhalt muss ausgefüllt werden')
    end
  end

  context 'slug' do
    it 'is required' do
      post = build(:post, slug: nil)
      expect(post).not_to be_valid
      expect(post.errors.full_messages.first).to eq('Slug muss ausgefüllt werden')
    end

    it 'is unique' do
      create(:post, slug: 'slug')
      post = build(:post, slug: 'slug')
      expect(post).not_to be_valid
      expect(post.errors.full_messages.first).to eq('Slug ist bereits vergeben')
    end

    it 'cannot be in invalid format with spaces' do
      post = build(:post, slug: 'a b c')
      expect(post).not_to be_valid
      expect(post.errors.full_messages.first).to eq('Slug ist nicht gültig')
    end

    it 'cannot be in invalid format with special characters' do
      post = build(:post, slug: 'test-@-title')
      expect(post).not_to be_valid
      expect(post.errors.full_messages.first).to eq('Slug ist nicht gültig')
    end

    it 'can be in valid format' do
      post = build(:post, slug: 'test-title')
      expect(post).to be_valid
    end
  end

  describe '.recent_first' do
    it 'returns the posts ordered by the most recent first' do
      oldest_post_id = create(:post, created_at: 3.days.ago).id
      newest_post_id = create(:post, created_at: 1.day.ago).id
      middle_post_id = create(:post, created_at: 2.days.ago).id

      expect(described_class.recent_first.pluck(:id)).to eq([newest_post_id, middle_post_id, oldest_post_id])
    end
  end

  describe '#content_preview' do
    it 'truncates at 350 characters' do
      post = build(:post, :with_long_content)
      expect(post.content_preview).to eq(post.content.to_plain_text.truncate(350))
    end

    it 'strips new lines' do
      post = build(:post, :with_new_lines_in_content)
      expect(post.content_preview).to eq('a b c')
    end
  end
end
