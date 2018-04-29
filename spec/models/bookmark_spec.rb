require "spec_helper"

# write tests to validate length, format, presence

RSpec.describe Bookmark, :type => :model do
  before(:each) do
    @site = Site.create
    @bookmark = @site.bookmarks.new(
      title: "test bookmark",
      url:   "https://www.reddit.com/r/tightpussy/", # it's about cats in tight spaces
      shortening: "https://www.short.com/tp")
  end

  context "must validate" do

    it "with correct values" do
      expect(@bookmark).to be_valid
    end

    it "a title" do
      @bookmark.title = nil
      expect(@bookmark).not_to be_valid
    end

    it "a top level site" do
      skip
      ("fix the belonging synta with rspec")
      @bookmark.site_id = nil
      expect(@bookmark).not_to be_valid
    end

    it "an URL" do
      skip
      @bookmark.url = nil
      expect(@bookmark).not_to be_valid
    end

    it "a shortening" do
      @bookmark.shortening = nil
      expect(@bookmark).not_to be_valid
    end

    it "a belonging to a Site" do
      # skip
      # site = Site.new
      # @bookmark.site << site
      ("fix the belonging syntax with rspec")
      expect(@bookmark.site).to be_instance_of(Site)
    end
  end
end