#################################################################
#	function that prepare the word for phonetic check	#
#								#
#	param word : the word to be prepared			#
#								#
#	return string : the prepared word			#
#################################################################
def prepare(word)
	aux = word.downcase
	## remove first char until a valid one is found
	while(/[^a-z]/.match(aux[0]))
		aux[0] = ''
	end
	## saving first char
	# tried to do this via regex (classier)
	# but it this way was faster (roughier)
	_word = aux[0]
	## remove unwanted chars and add back the first char
	_word << aux.gsub(/[^b-dfgj-np-tvxz]/, '')
	## remove repeating chars
	_word.squeeze!
	## change equivalent chars to pre-defined basic chars
	_word.gsub!(/[aeiou]/, 'a')
	_word.gsub!(/[cgjkqsxyz]/, 'c')
	_word.gsub!(/[bfpvw]/, 'b')
	_word.gsub!(/[dt]/, 'd')
	_word.gsub!(/[mn]/, 'm')
	return _word
end

#################################################################
#	function that checks the phonetic equivalency		#
#	between two giver words and prints the result		#
#								#
#	param word1 word2 : the words to be checked		#
#								#
#	return string : the word, if they are equivalent	#
#################################################################
def check(word1, word2)
	_word1 = prepare(word1)
	_word2 = prepare(word2)
	if(_word1 == _word2)
		return word2
	else
		return ''
	end
end

#################################################################
#								#
#			     main				#
#								#
#################################################################
contents = []
STDIN.each_line do |line|
	contents.push(line)
end

ARGV.each do |input|
	_result = []
	contents.each do |_dictWord|
		_result.push(check(input, _dictWord))
	end
	output = ''
	output << input + ": "
	first = true
	_result.each do |word|
		if(word != '')
			word.delete!("\n")
			if(!first)
				output << ", " + word
			else
				first = false
				output << word
			end
		end
	end
	puts output
end
