## Background

A WordSource is a source of words. You can get words from it by calling the `next_word` method.

It keeps analytical information of each word that it has seen.

## Example

   There are several potential sources for the words. In this example we assume that the word source has been initialised with the following string: `"lorem,ipsum,ipsum"`

```ruby
   src = LoremIpsumWordSource.new
   src.next_word
     # => "lorem"
   src.next_word
     # => "ipsum"
   src.next_word
     # => "ipsum"
   src.top_5_words
     # => ["ipsum","lorem",nil,nil,nil]
   src.top_5_consonants
     # => ["m","p","s","l","r"]
   src.count
     # => 3 # total words seen
```

### Run method

```ruby
   src = LoremIpsumWordSource.new
   # This will run until there are no more words for the source implementation.
   src.run
     # => true
```

## Assignment

1. Implement LoremIpsumWordSource that pulls in words from "lorem_ipsum.txt"; include the methods described above
2. Add callbacks on specific words e.g. every time "semper" is encountered, call those callbacks registered for "semper"
3. implement a WordSource that uses the twitter API (instead of loading words from a file)
