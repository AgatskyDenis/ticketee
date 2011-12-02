require 'spec_helper'

describe TagsController do

  describe "GET 'remove'" do
    it "should be successful" do
      get 'remove'
      response.should be_success
    end
  end

end
