require 'spec_helper'

describe Reference do

  describe '#filename=' do

    let(:galaxy)      { mock_model(Galaxy) }
    let(:filehandle)  { mock('filehandle') }
    let(:filename)    { fixture_filename('NGC1365.fit') }

    before do
      Galaxy.stub(:find_or_create_by_name).with('NGC1365') { galaxy }
      File.stub(:open).with(filename) { filehandle }
    end

    it 'sets the galaxy and fits file' do
      subject.should_receive(:fits=).with(filehandle)
      subject.should_receive(:galaxy=).with(galaxy)
      subject.filename = filename
    end

  end

end
