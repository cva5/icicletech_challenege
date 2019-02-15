require 'date'

class NumberToWordsConverter

  def generate_words(phone_number)
    return [] if phone_number.nil? || phone_number.length != 10 || phone_number.split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 0

    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}

    dictionary = {}
    for i in (1..30)
      dictionary[i] = []
    end
    file_path = File.expand_path File.join(File.dirname(__FILE__), '../resources', 'dictionary.txt')
    File.foreach( file_path ) do |word|
      dictionary[word.length] << word.chop.to_s.downcase
    end

    keys = phone_number.chars.map{|digit|letters[digit]}

    results = {}
    total_number = keys.length - 1

    for i in (2..total_number - 2)
      first_array = keys[0..i]
      next if first_array.length < 3
      second_array = keys[i + 1..total_number]
      next if second_array.length < 3
      first_combination = first_array.shift.product(*first_array).map(&:join) # Get product of arrays #get_combination(first_array, dictionary)#
      next if first_combination.nil?
      second_combination = second_array.shift.product(*second_array).map(&:join)
      next if second_combination.nil?
      results[i] = [(first_combination & dictionary[i+2]), (second_combination & dictionary[total_number - i +1])] # get common values from arrays
    end

    final_words = []
    results.each do |key, combinataions|
      next if combinataions.first.nil? || combinataions.last.nil?
      combinataions.first.product(combinataions.last).each do |combo_words|
        final_words << combo_words
      end
    end

    final_words << (keys.shift.product(*keys).map(&:join) & dictionary[11]).join(", ")
    final_words
  end
end

final_words = NumberToWordsConverter.new().generate_words("6686787825")
print final_words

final_words1 = NumberToWordsConverter.new().generate_words("9500743795")
print final_words1
