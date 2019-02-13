require 'date'

class NumberToWordsConverter

  def generate_words(phone_number)
    return [] if phone_number.nil? || phone_number.length != 10 || phone_number.split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 0

    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}

    dictionary = {}
    for i in (1..30)
      dictionary[i] = []
    end
    file_path = "../resources/dictionary.txt"
    File.foreach( file_path ) do |word|
      puts word
      dictionary[word.length] << word.chop.to_s.downcase
    end

    #TODO add code to generate words from given mobile number

  end
  NumberToWordsConverter.new.generate_words("6686787825")
end
