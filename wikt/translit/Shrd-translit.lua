local export = {}

local consonants = {
	['๐']='k', ['๐']='kh', ['๐']='g', ['๐']='gh', ['๐']='แน',
	['๐']='c', ['๐']='ch', ['๐']='j', ['๐']='jh', ['๐']='รฑ', 
	['๐']='แนญ', ['๐']='แนญh', ['๐']='แธ', ['๐']='แธh', ['๐']='แน', 
	['๐ ']='t', ['๐ก']='th', ['๐ข']='d', ['๐ฃ']='dh', ['๐ค']='n', 
	['๐ฅ']='p', ['๐ฆ']='ph', ['๐ง']='b', ['๐จ']='bh', ['๐ฉ']='m',
	['๐ช']='y', ['๐ซ']='r', ['๐ฌ']='l', ['๐ฎ']='v', ['๐ญ']='แธท',
	['๐ฏ']='ล', ['๐ฐ']='แนฃ', ['๐ฑ']='s', ['๐ฒ']='h',
}

local diacritics = {
	['๐ณ']='ฤ', ['๐ด']='i', ['๐ต']='ฤซ', ['๐ถ']='u', ['๐ท']='ลซ', ['๐ธ']='แน', ['๐น']='แน', 
	['๐บ']='แธท', ['๐ป']='แธน', ['๐ป']='e', ['๐ฝ']='ai', ['๐พ']='o', ['๐ฟ']='au',  ['๐']='',
}

local tt = {
	-- vowels
	['๐']='a', ['๐']='ฤ', ['๐']='i', ['๐']='ฤซ', ['๐']='u', ['๐']='ลซ', ['๐']='แน', ['๐']='แน',
	['๐']='แธท', ['๐']='แธน', ['๐']='e', ['๐']='ai', ['๐']='o', ['๐']='au', 
	-- chandrabindu    
	['๐']='mฬ', --until a better method is found
	-- anusvara    
	['๐']='แน', --until a better method is found
	-- visarga    
	['๐']='แธฅ',
	-- avagraha
	['๐']='โ',
	--numerals
	['๐']='0', ['๐']='1', ['๐']='2', ['๐']='3', ['๐']='4', ['๐']='5', ['๐']='6', ['๐']='7', ['๐']='8', ['๐']='9',
	--punctuation        
    ['๐']='.', --double danda
	['๐']='.', --danda
    --Vedic extensions
    ['๐']='x', ['๐']='f',
    --Om
    ['๐']='oแน',
    --reconstructed
    ['*'] = '',
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		'([๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ ๐ก๐ข๐ฃ๐ค๐ฅ๐ฆ๐ง๐จ๐ฉ๐ช๐ซ๐ฌ๐ฎ๐ญ๐ฏ๐ฐ๐ฑ๐ฒ])'..
		'([๐ณ๐ด๐ต๐ถ๐ท๐ธ๐น๐บ๐ป๐ผ๐ฝ๐พ๐ฟ๐]?)',
		function(c, d)
			if d == "" then        
				return consonants[c] .. 'a'
			else
				return consonants[c] .. diacritics[d]
			end
		end)

	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end
 
return export