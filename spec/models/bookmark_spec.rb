require "spec_helper"

# write tests to validate length, format, presence

RSpec.describe Bookmark, :type => :model do
  before(:each) do
    @site = Site.create
    @bookmark = @site.bookmarks.new(
      title: "test bookmark",
      url:   "http://www.reddit.com/r/tightpussy/", # it's about cats in tight spaces
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
      skip ("see Readme/Problems")
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
      # ("fix the belonging syntax with rspec")
      expect(@bookmark.site).to be_instance_of(Site)
    end
  end
end

RSpec.describe BookmarksController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Bookmark. As you add validations to Bookmark, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: "test bookmark",
      url:   "https://www.reddit.com/r/surrealmemes", 
      shortening: "https://www.short.com/tp",
      site_id: 1  } # this is very lazy
  }

  let(:invalid_attributes) {
    { title: "",
      url:   "", 
      shortening: "",
      site_id: nil  }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BookmarksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      bookmark = Bookmark.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      bookmark = Bookmark.create! valid_attributes
      get :show, params: {id: bookmark.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      bookmark = Bookmark.create! valid_attributes
      get :edit, params: {id: bookmark.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bookmark" do
        expect {
          post :create, params: {bookmark: valid_attributes}, session: valid_session
        }.to change(Bookmark, :count).by(1)
      end

      it "redirects to the created bookmark" do
        post :create, params: {bookmark: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Bookmark.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {bookmark: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested bookmark" do
        bookmark = Bookmark.create! valid_attributes
        put :update, params: {id: bookmark.to_param, bookmark: new_attributes}, session: valid_session
        bookmark.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the bookmark" do
        bookmark = Bookmark.create! valid_attributes
        put :update, params: {id: bookmark.to_param, bookmark: valid_attributes}, session: valid_session
        expect(response).to redirect_to(bookmark)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        bookmark = Bookmark.create! valid_attributes
        put :update, params: {id: bookmark.to_param, bookmark: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bookmark" do
      bookmark = Bookmark.create! valid_attributes
      expect {
        delete :destroy, params: {id: bookmark.to_param}, session: valid_session
      }.to change(Bookmark, :count).by(-1)
    end

    it "redirects to the bookmarks list" do
      bookmark = Bookmark.create! valid_attributes
      delete :destroy, params: {id: bookmark.to_param}, session: valid_session
      expect(response).to redirect_to(bookmarks_url)
    end
  end

end