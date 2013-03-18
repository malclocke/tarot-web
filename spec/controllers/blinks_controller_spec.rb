require 'spec_helper'

describe BlinksController do

  describe '#index' do

    specify do
      get :index
      response.should render_template('index')
    end

  end

end
