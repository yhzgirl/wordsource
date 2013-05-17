require 'spec_helper'
require "ruby-developer-test/abstract/word_source"

describe WordSource do
  let(:source) {WordSource.new}
  
  context '#run'
  it { should respond_to (:run) }

  it { should respond_to(:next_word) }

  it { should respond_to (:top_5_consonants) }

  it { should respond_to (:top_5_words) }

  it { should respond_to (:count) }

  it { should respond_to (:callback) }

end
