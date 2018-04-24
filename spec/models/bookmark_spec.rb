require "spec_helper"

RSpec.describe Bookmark, :type => :model do
  before(:each) do
    @bookmark = Site.new.bookmarks.new
  end

  it "should be valid" do
    expect(@bookmark).to be_valid
  end

  context "must have" do
    it "a title" do
      @bookmark.title = nil
      expect(@bookmark).not_to be_valid
    end

    it "a top level site" do
      @bookmark.site_id = nil
      expect(@bookmark).not_to be_valid
    end

    it "an URL" do
      @bookmark.url = nil
      expect(@bookmark).not_to be_valid
    end

    it "a shortening" do
      @bookmark.shortening = nil
      expect(@bookmark).not_to be_valid
    end
  end
end