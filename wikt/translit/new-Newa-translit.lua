-- Transliteration for Newar in Newa script

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
-- consonants
['๐'] = 'k', ['๐'] = 'kh', ['๐'] = 'g', ['๐'] = 'gh', ['๐'] = 'แน', ['๐'] = 'แนh',
['๐'] = 'c', ['๐'] = 'ch', ['๐'] = 'j', ['๐'] = 'jh', ['๐'] = 'รฑ', ['๐'] = 'รฑh',
['๐'] = 'แนญ', ['๐'] = 'แนญh', ['๐'] = 'แธ', ['๐'] = 'แธh', ['๐'] = 'แน', 
['๐'] = 't', ['๐ '] = 'th', ['๐ก'] = 'd', ['๐ข'] = 'dh', ['๐ฃ'] = 'n', ['๐ค'] ='nh',
['๐ฅ'] = 'p', ['๐ฆ'] = 'ph', ['๐ง'] = 'b', ['๐จ'] = 'bh', ['๐ฉ'] = 'm', ['๐ช'] ='mh',
['๐ซ'] = 'y', ['๐ฌ'] = 'r', ['๐ญ'] = 'rh', ['๐ฎ'] = 'l', ['๐ฏ'] = 'lh',  ['๐ฐ'] = 'w', ['๐ฑ'] = 'ล', ['๐ฒ'] = 'แนฃ', ['๐ณ'] = 's', ['๐ด'] = 'h',
 																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																	-- vowel diacritics
['๐ถ'] = 'i', ['๐ธ'] = 'u', ['๐พ'] = 'e', ['๐'] = 'o', ['๐ต'] = 'ฤ', ['๐ท'] = 'ฤซ', ['๐น'] = 'ลซ', ['๐บ'] = 'rฬฅ', ['๐ป'] = 'rฬฅฬ', ['๐ผ'] = 'lฬฅ', ['๐ฝ'] = 'lฬฅฬ', ['๐ฟ'] = 'ai', ['๐'] = 'au',
																																																																														-- vowels
['๐'] = 'a', ['๐'] = 'i', ['๐'] = 'u', ['๐'] = 'e', ['๐'] = 'o', ['๐'] = 'ฤ', ['๐'] = 'ฤซ', ['๐'] = 'ลซ', ['๐'] = 'rฬฅ', ['๐'] = 'rฬฅฬ', ['๐'] = 'lฬฅ', ['๐'] = 'lฬฅฬ', ['๐'] = 'ai', ['๐'] = 'au',
																																																																														-- chandrabindu
['๐'] = 'ฬ',
-- anusvara
['๐'] = 'แน', ['๐'] = 'แน',
-- visarga
['๐'] = 'แธฅ',
-- nuqta
['๐'] = '',
-- virama
['๐'] = '',
-- om
['๐'] = 'om',
-- avagraha
['๐']='โ',
-- numerals
['๐'] = '0', ['๐'] = '1', ['๐'] = '2', ['๐'] = '3', ['๐'] = '4', ['๐'] = '5', ['๐'] = '6', ['๐'] = '7', ['๐'] = '8', ['๐'] = '9', 
-- punctuation
['๐'] = '.', -- danda
['๐'] = '.', -- double danda
['๐'] = '', -- comma
-- abbreviation sign
['๐'] = '.',
		}																

local all_cons, special_cons = '๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ ๐ก๐ข๐ฃ๐ค๐ฅ๐ฆ๐ง๐จ๐ฉ๐ช๐ซ๐ฌ๐ญ๐ฎ๐ฏ๐ฐ๐ฑ๐ฒ๐ณ๐ด', '๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ ๐ก๐ข๐ฃ๐ค๐ฅ๐ฆ๐ง๐จ๐ฉ๐ช๐ซ๐ฌ๐ญ๐ฎ๐ฏ๐ฐ๐ฑ๐ฒ๐ณ๐ด'
local vowel, vowel_sign = 'a๐ผ๐ฝ๐พ๐ฟ๐๐๐ป๐บ๐น๐ธ๐ถ๐ต๐ท',  '๐๐๐๐๐๐๐๐๐๐๐๐๐๐'


local function rev_string(text)
	local result, length = {}, mw.ustring.len(text)
			for i = length, 1, -1 do
							table.insert(result, mw.ustring.sub(text, i, i))
												end
																		return table.concat(result)
																								end
																								function export.tr(text, lang, sc)
																									text = gsub(text, '([' .. all_cons .. ']๐?)([' .. vowel .. '๐]?)', function(c, d)
																												return c .. (d == "" and 'a' or d) end)
for word in mw.ustring.gmatch(text, "[๐-๐งa]+") do
																																						local orig_word = word
																																														word = rev_string(word)
																																																								word = gsub(word, '^a(๐?)([' .. all_cons .. '])(.)(.?)', function(opt, first, second, third)
																																																																					return (((match(first, '[' .. special_cons .. ']') and match(second, '๐')
or match(first, '[' .. special_cons .. ']') and match(second, '๐') and not perm_cl[first..second..third])
																																																																																						or match(first .. second, '๐ซ[๐๐๐๐๐๐๐๐๐๐๐๐๐๐a๐ผ๐ฝ๐พ๐ฟ๐๐๐ป๐บ๐น๐ธ๐ถ๐ต๐ท]') or match(first .. second, '๐ด[๐๐๐๐๐๐๐๐๐๐๐๐๐๐a๐ผ๐ฝ๐พ๐ฟ๐๐๐ป๐บ๐น๐ธ๐ถ๐ต๐ท]'))																																																																													
																																																																																																											and 'a' or "") .. opt .. first .. second .. third end)
word = gsub(word, '(.?)๐(.)', function(succ, prev)
																																																																																																																																																																																																																																																							return succ .. (succ..prev == "" and "๐๐ฉ" or 
																																																																																																																																																																																																																																																																																												(succ == "" and match(prev, '[' .. vowel .. ']') and "ฬ" or nasal_assim[succ] or "แน")) .. prev end)

local escaped_orig_word = gsub(orig_word, "%+", "")																																																																																																																																																																																																																																																																																																																																	text = gsub(text, orig_word, rev_string(word))	
text = gsub(text, '๐ซ๐', 'y')																																																																																																																																																																																																																																																																																																																																											end
																																																																																																																																																																																																																																																																																																																																																																																																																				text = gsub(text, '.๐?', conv)
																																																																																																																																																																																																																																																																																																																																																																																																																																																														text = gsub(text, 'a([iu])ฬ', 'aอ %1')
text = gsub(text, "[<>]", "")		    																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							    																																										        																																										        	return mw.ustring.toNFC(text)
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																								    																																										        																																										        																																											        	end
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																								    																																										        																																										        																																											        	return export