class AnagramFinder

	# Open wordlist file and store the words in a hash
	def initialize(wordlist_file)
		raise ArgumentError, "Wordlist file could not be found" unless File.exists?(wordlist_file)
		@words = {}

		File.open(wordlist_file).each_line do |line|
			key = generate_hash_key(line)
			@words[key] ||= []
			@words[key] << line.strip
		end
	end

	# Lookup anagrams for the given word
	def get_anagrams_for(word)
		key = generate_hash_key(word)
		(@words[key] || []).select {|x| x.casecmp(word) != 0 }
	end

	
	private

	# Sort letters in word alphabetically so words that are anagrams are stored using same hashkey (for fast lookups)	
	def generate_hash_key(word)
		word.strip.downcase.chars.sort.join.to_sym
	end

end
