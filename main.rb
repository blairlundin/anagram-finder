#!/usr/bin/env ruby

require_relative 'lib/anagram_finder'

print 'Loading word list...'
af = AnagramFinder.new('wordlist.txt')
puts 'loaded'


loop do
	puts "\nEnter a word to find its anagrams"
	puts "Type 'exit' to quit"
	print ": "
	input = gets.strip

	break if input.casecmp('exit') == 0

	for word in input.split(' ')
		anagrams = af.get_anagrams_for(word)
		if anagrams.empty? then
			puts "No anagrams found for '#{word}'"
		else
			puts "Anagrams for '#{word}': " + anagrams.join(', ')
		end
	end
end