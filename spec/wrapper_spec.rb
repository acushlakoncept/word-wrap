require_relative '../wrapper'

describe Wrapper do
  describe '#wrap' do
    subject { Wrapper.new(string, column).wrap }
    let(:string) { 'word' }
    let(:column) { 6 }

    context 'single word length less than column' do
      it { should eq 'word' }
    end

    context 'single word length greater than column' do
      let(:string) { 'wordwordword' }
      let(:column) { 4 }
      it { should eq("word\nword\nword") }
    end

    context 'multiple word greater than column' do
      let(:string) { 'word word word' }
      let(:column) { 10 }
      it { should eq("word word\nword") }
    end

    context 'mixes breaks at words and spaces' do
      let(:string) { 'word word word' }
      let(:column) { 3 }
      it { should eq("wor\nd\nwor\nd\nwor\nd") }
    end

    context 'when number is provided in place of string' do
      let(:string) { 1253485 }
      let(:column) { 3 }
      it { should eq "Expected String but got #{string.class}" }
    end

    context 'when 0 column provided' do
      let(:string) { 'word word' }
      let(:column) { 0 }
      it { should eq 'Provide a column atleast greater than 0' }
    end

    context 'when provided column is not a string' do
      let(:string) { 'word word' }
      let(:column) { "col" }
      it { should eq "Expected Integer but got #{column.class}" }
    end

  end
end
