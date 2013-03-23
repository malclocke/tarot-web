require 'spec_helper'

describe NightImagesController do

  describe '#next' do

    let(:night_image) { mock_model(NightImage, :to_json => '{}') }

    before do
      NightImage.stub(:next => night_image)
    end

    specify do
      get :next, :format => :json
      assigns[:night_image].should == night_image
    end

  end

end
