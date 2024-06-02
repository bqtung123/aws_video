require 'rails_helper'

RSpec.describe Post, type: :model do
  context "db" do
    context "associations" do
      it { is_expected.to belong_to(:user) }
    end

    context "validates" do
      let(:user) { create :user }
      it "youtube_url required" do
        post = build :post, user: user
        expect(post).to be_invalid
      end

      it "youtube_url invalid" do
        post = build :post, youtube_url: "abcd1234", user: user
        expect(post).to be_invalid
      end

      it "youtube_url valid" do
        post = build :post, youtube_url: "https://www.youtube.com/watch?v=ueqZ2rogKj0", user: user
        expect(post).to be_valid
      end
    end
  end
end
