require "spec_helper"
require "ruby-developer-test/abstract/word_source"

describe WordSource do
  # let(:words) {WordSource.new(:wordsource => "lorem_ipsum.txt")}
  before :each do
  	@src = WordSource.new("lorem_ipsum.txt")
  end

  subject { @src }

  it { should respond_to(:run) }

  it { should respond_to(:next_word) }

  it { should respond_to (:count) }

	it { should respond_to(:top_5_words_seen) }

	it { should respond_to(:top_5_consonants_seen) }

#this is not testing for the right thing
  describe "#run" do
    it "will run until there are no words left in the wordsource" do
      @src.run
      expect(@wordsource).to eq(nil)
    end
  end

  describe "#next_word" do
  	it "returns next word in file" do
  		expect(@src.next_word).to eq("lorem")
  	end

  	it "returns the second word in file if called twice" do
  		word = @src.next_word
  		word = @src.next_word
  		expect(word).to eq("ipsum")
  	end
  end

  	describe "#count" do
  		it "returns number of words seen on the screen" do
  			4.times {word = @src.next_word}
  			expect(@src.count).to eq(4)
  		end

  		it "returns 0 if no words seen" do
  			expect(@src.count).to eq(0)
  		end
  	end

  	describe "#top_5_words_seen" do
  		it "returns top 5 words seen" do
  			40.times {word = @src.next_word}
  			expect(@src.top_5_words_seen).to  eq(["lorem", "semper", "ipsum", "fusce", "interdum"])
  		end

  		it "returns top words available if less than 5 words to return" do
  			3.times {word = @src.next_word}
  			expect(@src.top_5_words_seen).to  eq(["dolor", "ipsum", "lorem"])
  		end

  		it "returns string if no words yet displayed" do
  			expect(@src.top_5_words_seen).to eq('You have not seen any words.')
  		end
  	end

    describe "#top_5_words" do
      it "returns top 5 words in wordsource" do
        expect(@src.top_5_words).to eq(["sed", "in", "ut", "vel", "vitae"])
      end
    end

    describe "#top_5_consonants" do
      it "returns top 5 consonants in wordsource" do
        expect(@src.top_5_consonants).to eq(["s", "t", "n", "l", "r"])
      end
    end

  	describe "#top_5_consonants_seen" do
  		it "returns top 5 consonants seen" do
  			40.times {word = @src.next_word}
  			expect(@src.top_5_consonants_seen).to eq(["t", "m", "s", "n", "r"])
  		end

  		it "does not return any non alpha characters" do
  			500.times {word = @src.next_word}
  			(@src).should_not include =~ /\W/
  		end

  		it "returns top consonants seen if less than 5" do
  			1.times {word = @src.next_word}
  			expect(@src.top_5_consonants_seen).to eq(["m", "r", "l"])
  		end

  		it "returns string if no words yet displayed" do
  			expect(@src.top_5_consonants_seen).to eq('You have not seen any words.')
  		end
  	end
end