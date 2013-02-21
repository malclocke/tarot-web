require 'spec_helper'

describe Galaxy do

  describe '#name' do

    context 'when name is missing' do
      before { subject.name = nil }
      it { should_not be_valid }
    end

  end

end
