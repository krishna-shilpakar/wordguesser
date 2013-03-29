class WordCollection
  
  # WORDS = []
  # # File.open(File.dirname(__FILE__) + "/Words/en.txt")
  File.open(File.dirname(__FILE__) + "en.txt") do |file|
    file.each do |line|
      WORDS << line.strip
    end
  end
  attr_reader :matched_words
  
  def initialize(string)
    @str = string
    @str = @str.split("")
    @matched_words = []
  end
  
  def get_words_with_length(cnt)
    words_with_length = WORDS.select{|w| w if w.length == cnt}
    words_with_length.each do |word|
      new_arr = @str.dup
      
      consists = word.split("").all? do |w|
         ind = new_arr.index(w)
         new_arr.delete_at(ind) if ind
         ind ? true : false
       end
       if consists 
         @matched_words << word
       end
    end
    @matched_words
  end
  
end