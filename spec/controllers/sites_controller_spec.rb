require 'rails_helper'

RSpec.describe SitesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Site. As you add validations to Site, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { top_level_url: "www.coso.com" }
  }

  let(:invalid_attributes) {
    { top_level_url: "" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SitesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      site = Site.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      site = Site.create! valid_attributes
      get :show, params: {id: site.to_param}, session: valid_session
      expect(response).to be_success
    end
  end


end
