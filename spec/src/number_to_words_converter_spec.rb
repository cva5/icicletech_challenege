require_relative '../../src/number_to_words_converter'
#require File.expand_path File.join(File.dirname(__FILE__), '../resources', 'dictionary.txt')
# eval(File.open(File.expand_path('resources/dictionary.txt')).read)

describe NumberToWordsConverter do
  it "should be true" do
    expect(NumberToWordsConverter.new.generate_words('6686787825')).to match_array( [["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"])
  end
  it 'should not match the partials' do
    expect(NumberToWordsConverter.new.generate_words('9500743795')).not_to include(["NOUN", "PUPU"])
  end
  it 'should not match the partials' do
    expect(NumberToWordsConverter.new.generate_words('9500743795')).not_to be nil
  end
  it "should be true for capital case" do
    expect(NumberToWordsConverter.new.generate_words('2282668687')).to match_array( [["ACT", "AMOUNTS"], ["ACT", "CONTOUR"], ["ACTA", "MOUNTS"], ["BAT", "AMOUNTS"], ["BAT", "CONTOUR"], ["CAT", "CONTOUR"], "CATAMOUNTS"])
  end
  it 'raises error for invalid symbols (0) in the phone' do
    expect (NumberToWordsConverter.new.generate_words('0')).to raise_error(RuntimeError, "Invalid symbol '0' in the phone")
  end
end