require 'spec_helper'

describe BlinksController do

  describe '#index' do

    let(:reference)   { mock('reference') }
    let(:night_image) { mock('night_image', :reference => reference) }

    before do
      NightImage.stub(:next => night_image)
    end

    specify do
      get :index
      assigns[:night_image].should == night_image
      response.should render_template('index')
    end

  end

end
