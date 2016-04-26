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
	## remove all vowels since they are equivalents
	_word = _word.gsub(/[aeiou]/, '')
	## remove repeating chars
	_word.squeeze!
	return _word
end

#################################################################
#	function that checks the phonetic equivalency		#
#		and prints the result				#
#								#
#	param word : the word to be checked			#
#################################################################
def check(word)
	puts word
end

dict = File.open("word_dict.txt", "r")
contents = dict.read

ARGV.each do|input|
	check(prepare(input))
end

puts 'ruby ruby rubeeey'

dict.close
