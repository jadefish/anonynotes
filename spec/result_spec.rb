require 'spec_helper'
require 'result'

shared_context :Err do
  subject { Result.err(err) }
end

shared_context :Ok do
  subject { Result.ok(value) }
end

describe Result do
  let(:value) { 42 }
  let(:err) { 'oh no' }
  let(:default) { 0 }

  describe :unwrap do
    context 'with an error' do
      include_context :Err

      it 'raises' do
        expect { subject.unwrap }.to raise_error UnwrapError
      end
    end

    context 'with a value' do
      include_context :Ok

      it 'returns the value' do
        expect(subject.unwrap).to eq value
      end
    end
  end

  describe :unwrap_or do
    context 'with an error' do
      include_context :Err

      it 'returns the provided default' do
        expect(subject.unwrap_or(default)).to eq default
      end
    end

    context 'with a value' do
      include_context :Ok

      it 'returns the value' do
        expect(subject.unwrap_or(default)).to eq value
      end
    end
  end

  describe :unwrap_or_else do
    context 'with an error' do
      include_context :Err

      it 'executes the error block' do
        expect(subject.unwrap_or_else { |e| e * 2 }).to eq 'oh nooh no'
      end
    end

    context 'with a value' do
      include_context :Ok

      it 'returns the value' do
        expect(subject.unwrap_or_else { |e| e * 2 }).to eq value
      end
    end
  end
end
