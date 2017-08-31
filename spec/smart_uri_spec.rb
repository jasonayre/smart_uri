require 'spec_helper'

describe SmartURI do
  it 'has a version number' do
    expect(SmartURI::VERSION).not_to be nil
  end

  subject{ ::SmartURI.join('http://www.google.com') }

  context "Class Methods" do
    context ".join" do
      it do
        expect(subject).to be_a(::SmartURI::URI)
        expect(subject.__getobj__).to be_a(::URI)
      end
    end

    context ".new" do
      subject{ ::SmartURI::URI.new('http://www.google.com') }
      it { expect(subject.__getobj__).to be_a(URI) }
    end
  end

  context "Instance Methods" do
    context "#join" do
      subject{ ::SmartURI::URI.join('http://www.google.com').join('one', 'two').join('three', 'four') }

      it { expect(subject.to_s).to eq('http://www.google.com/one/two/three/four') }

      context "with params" do
        subject{ ::SmartURI::URI.join('http://www.google.com').join('one', 'two').join('three', 'four', :query => {:id => 1}) }
        it { expect(subject.to_s).to eq('http://www.google.com/one/two/three/four?id=1') }
      end
    end
  end
end
