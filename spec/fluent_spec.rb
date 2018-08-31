require 'spec_helper'

describe Fluent do
  it 'has a version number' do
    expect(Fluent::VERSION).not_to be nil
  end

  describe Fluent do
    it { expect(Fluent).not_to be nil }
    it { expect(Fluent::Lexicon).not_to be nil }
  end
end
