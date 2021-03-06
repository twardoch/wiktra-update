-- Transliteration for Bhojpuri

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
	-- consonants
	['๐'] = 'k', ['๐'] = 'kh', ['๐'] = 'g', ['๐'] = 'gh', ['๐'] = 'แน', 
	['๐'] = 'c', ['๐'] = 'ch', ['๐'] = 'j', ['๐'] = 'jh', ['๐'] = 'รฑ', 
	['๐'] = 'แนญ', ['๐'] = 'แนญh', ['๐'] = 'แธ', ['๐'] = 'แธh', ['๐'] = 'แน',
	['๐'] = 't', ['๐'] = 'th', ['๐ '] = 'd', ['๐ก'] = 'dh', ['๐ข'] = 'n',
	['๐ฃ'] = 'p', ['๐ค'] = 'ph', ['๐ฅ'] = 'b', ['๐ฆ'] = 'bh', ['๐ง'] = 'm', 
	['๐จ'] = 'y', ['๐ฉ'] = 'r', ['๐ช'] = 'l', ['๐ซ'] = 'v', ['๐ซ'] = 'v', ['เคณ'] = 'แธท',
	['๐ฌ'] = 'ล', ['๐ญ'] = 'แนฃ', ['๐ฎ'] = 's', ['๐ฏ'] = 'h',
	['๐'] = 'แน', ['๐'] = 'แน', ['๐'] = 'แนh', ['๐'] = 'แนh',
	-- ['๐๐น๐'] = 'gy',

	-- vowel diacritics
	['๐ฑ'] = 'i', ['๐ณ'] = 'u', ['๐ต'] = 'e', ['๐ท'] = 'o', 
	['๐ฐ'] = 'ฤ', ['๐ฒ'] = 'ฤซ', ['๐ด'] = 'ลซ', 
	['๐ถ'] = 'ai', ['๐ธ'] = 'au',

	-- vowel signs
	['๐'] = 'a', ['๐'] = 'i', ['๐'] = 'u', ['๐'] = 'e', ['๐'] = 'o',
	['๐'] = 'ฤ', ['๐'] = 'ฤซ', ['๐'] = 'ลซ',  
	['๐'] = 'ai', ['๐'] = 'au', 
	
	['เฅ'] = 'om',
	
	-- chandrabindu
	['๐'] = 'ฬ',
	
	-- anusvara
	['๐'] = 'แน',
	
	-- visarga
	['๐'] = 'แธฅ',
	
	-- virama
	['๐น'] = '',
	
	-- numerals
	['เฅฆ'] = '0', ['เฅง'] = '1', ['เฅจ'] = '2', ['เฅฉ'] = '3', ['เฅช'] = '4',
	['เฅซ'] = '5', ['เฅฌ'] = '6', ['เฅญ'] = '7', ['เฅฎ'] = '8', ['เฅฏ'] = '9',
	
	-- punctuation
	['๐'] = '.', -- danda
	['+'] = '', -- compound separator
	
	-- abbreviation sign
	['๐ป'] = '.',
}

local nasal_assim = {
	['๐'] = '๐', ['๐'] = '๐', ['๐'] = '๐', ['๐'] = '๐',
	['๐'] = '๐', ['๐'] = '๐', ['๐'] = '๐', ['๐'] = '๐',
	['๐'] = '๐', ['๐'] = '๐', ['๐'] = '๐', ['๐'] = '๐',
	['๐ฃ'] = '๐ง', ['๐ค'] = '๐ง', ['๐ฅ'] = '๐ง', ['๐ฆ'] = '๐ง', ['๐ง'] = '๐ง',
}

local perm_cl = {
	['๐ง๐น๐ช'] = true, ['๐ซ๐น๐ช'] = true, ['๐ซ๐น๐ช'] = true, ['๐ข๐น๐ช'] = true,
	
}

local all_cons, special_cons = '๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ ๐ก๐ฃ๐ค๐ฅ๐ฆ๐ฌ๐ญ๐ฎ๐จ๐ฉ๐ช๐ซ๐ฏ๐๐ข๐ง', '๐จ๐ฉ๐ช๐ฅ๐ซ๐ฏ๐ข๐ง'
local vowel, vowel_sign = 'a๐ฐ๐ฑ๐ฒ๐ณ๐ด๐ต๐ถ๐ท๐ธ', '๐๐๐๐๐๐๐๐๐๐'
local syncope_pattern = '([' .. vowel .. vowel_sign .. '])(๐บ?[' .. all_cons .. '])a(๐บ?[' .. gsub(all_cons, "๐จ", "") .. '])([๐๐]?[' .. vowel .. vowel_sign .. '])'

local function rev_string(text)
	local result, length = {}, mw.ustring.len(text)
	for i = 1, length do
		table.insert(result, mw.ustring.sub(text, length - i + 1, length - i + 1))
	end
	return table.concat(result)
end

function export.tr(text, lang, sc)
	text = gsub(
		text,
		'([' .. all_cons .. ']๐บ?)([' .. vowel .. '๐น]?)',
		function(c, d)
			return c .. (d == "" and 'a' or d)
		end
	)

	for word in mw.ustring.gmatch(text, "[๐-๐a]+") do
		local orig_word = word
		
		word = rev_string(word)
		
		word = gsub(
			word,
			'^a(๐บ?)([' .. all_cons .. '])(.)(.?)',
			function(opt, first, second, third)
				local a = ""
				if match(first, '[' .. special_cons .. ']')
					and match(second, '๐น')
					and not perm_cl[first..second..third]
					or match(first .. second, '๐จ[๐ฒ๐ต๐ถ]') then
						a = "a"
				end
				
				return a .. opt .. first .. second .. third
			end
		)
		
		while match(word, syncope_pattern) do
			word = gsub(word, syncope_pattern, '%1%2%3%4')
		end
		
		word = gsub(
			word,
			'(.?)๐(.)',
			function(succ, prev)
				local mid = nasal_assim[succ] or "n"
				if succ..prev == "a" then
					mid = "๐บ๐ง" 
				elseif succ == "" and match(prev, '[' .. vowel .. ']') then
					mid = "ฬ" 
				end
				return succ .. mid .. prev
			end
		)
		
		text = gsub(text, orig_word, rev_string(word))
	end
	text = gsub(text, '.๐บ?', conv)
	text = gsub(text, 'a([iu])ฬ', 'aอ %1')
    text = gsub(text, '๐๐น๐', conv)
	return mw.ustring.toNFC(text)
end

return export