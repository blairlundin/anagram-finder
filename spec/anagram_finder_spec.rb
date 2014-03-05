require 'anagram_finder'
require 'securerandom'


describe AnagramFinder do

	describe '#initialize' do
	    it 'raises an ArgumentError if the wordlist file does not exist' do
	    	expect{ AnagramFinder.new(SecureRandom.hex) }.to raise_error(ArgumentError)
	    end
	end

	describe '#get_anagrams_for' do
		let(:af) { AnagramFinder.new('wordlist.txt') }

	    it 'returns the correct result for a given word' do
	    	expect( af.get_anagrams_for('post') ).to include('stop')
	    end

	    it 'matches words case-insensitively' do
	    	expect( af.get_anagrams_for('POST') ).to include('stop')
	    end

	    it 'does not return anagrams for a word without any' do
	    	expect( af.get_anagrams_for('rhythm') ).to be_empty
	    end
	end
	
end