class WordSource

 attr_accessor :words_seen, :wordsource, :callbacks

  def initialize(wordsource = 'lorem_ipsum.txt')
    @wordsource = File.read(wordsource).downcase.scan(/[\w]+/)
    @words_seen = []
  end

  #believe this method is meant to be used for callback looping. 
  def run
    until @wordsource.empty?
      next_word
    end
  end

  def next_word
    @word = @wordsource.shift
    add_to_words_seen(@word)
    @word
  end

  def add_to_callback(word)
    @callbacks << word
  end

  def count
    @words_seen.size
  end

  def top_5_words_seen 
    if any_words_seen?
      @counts = Hash.new(0)
        for word in @words_seen
          @counts[word] += 1
        end
        ordered_return_of_top_5.map {|i| i[0]}
    else
      'You have not seen any words.'
    end
  end

  def top_5_words
    @counts = Hash.new(0)
    for word in @wordsource
      @counts[word] += 1
    end
      ordered_return_of_top_5.map {|i| i[0]}
  end

  def top_5_consonants_seen
    if any_words_seen?
      @counts = Hash.new(0)
      for letter in array_of_consonants_seen
        @counts[letter] += 1
      end
        ordered_return_of_top_5.map {|i| i[0][0]}
    else
      'You have not seen any words.'
    end
  end

  def top_5_consonants
    @counts = Hash.new(0)
    for letter in array_of_consonants
      @counts[letter] += 1
    end
      ordered_return_of_top_5.map {|i| i[0][0]}
  end

  private

  def add_to_words_seen(word)
    @words_seen << word
  end

  def any_words_seen?
    @words_seen.size > 0
  end

  def ordered_return_of_top_5
    @counts.sort_by {|k, v| v}.reverse[0..4]
  end

  def array_of_consonants_seen
    @words_seen.to_s.scan(/[^aeiou\W]/)
  end

  def array_of_consonants
    @wordsource.to_s.scan(/[^aeiou\W]/)
  end

end