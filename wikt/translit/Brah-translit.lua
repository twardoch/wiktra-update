local export = {}

local consonants = {
--consonants
	['๐']='k', ['๐']='kh', ['๐']='g', ['๐']='gh', ['๐']='แน',
	['๐']='c', ['๐']='ch', ['๐']='j', ['๐']='jh', ['๐']='รฑ', 
	['๐']='แนญ', ['๐']='แนญh', ['๐']='แธ', ['๐ ']='แธh', ['๐ก']='แน', 
	['๐ข']='t', ['๐ฃ']='th', ['๐ค']='d', ['๐ฅ']='dh', ['๐ฆ']='n', 
	['๐ง']='p', ['๐จ']='ph', ['๐ฉ']='b', ['๐ช']='bh', ['๐ซ']='m',
	['๐ฌ']='y', ['๐ญ']='r', ['๐ฎ']='l', ['๐ฏ']='v', ['๐ด']='แธท',
	['๐ฐ']='ล', ['๐ฑ']='แนฃ', ['๐ฒ']='s', ['๐ณ']='h',
}

local diacritics = {
--matras
	['๐ธ']='ฤ', ['๐บ']='i', ['๐ป']='ฤซ', ['๐ผ']='u', ['๐ฝ']='ลซ', ['๐พ']='แน', ['๐ฟ']='แน', 
	['๐']='lฬฅ', ['๐']='lฬฅฬ', ['๐']='e', ['๐']='ai', ['๐']='o', ['๐']='au',  ['๐']='',
    --bhattiprolu aa
    ['๐น']='ฤ',
}

local tt = {

--vowels
	['๐']='a', ['๐']='ฤ', ['๐']='i', ['๐']='ฤซ', ['๐']='u', ['๐']='ลซ', ['๐']='แน', ['๐']='แน',
	['๐']='lฬฅ', ['๐']='lฬฅฬ', ['๐']='e', ['๐']='ai', ['๐']='o', ['๐']='au', 
	-- chandrabindu    
	['๐']='mฬ', --until a better method is found
	-- anusvara    
	['๐']='แน', --until a better method is found
	-- visarga    
	['๐']='แธฅ',
	--numerals
	['๐ฆ']='0', ['๐ง']='1', ['๐จ']='2', ['๐ฉ']='3', ['๐ช']='4', ['๐ซ']='5', ['๐ฌ']='6', ['๐ญ']='7', ['๐ฎ']='8', ['๐ฏ']='9',
	--punctuation        
	['๐']='.', --danda
    ['๐']='.' --double danda
}

function export.tr(text, lang, sc)
	if sc ~= "Brah" then
		return nil
	end
	
	text = mw.ustring.gsub(
		text,
		'([๐-๐ด])'..
		'([๐ธ๐บ๐บ๐ป๐ผ๐ฝ๐พ๐ฟ๐๐๐๐๐๐๐๐น]?)'..
		'([๐-๐]?)',
		function(c, d, e)
			if d == "" and e ~= "" then        
				if tt[e] == "i" or tt[e] == "u" then return consonants[c] .. 'a' .. tt[e] .. 'ฬ'
				else return consonants[c] .. 'a' .. tt[e] end
			elseif e ~= "" then
				return consonants[c] .. diacritics[d] .. tt[e]
			elseif d == "" then        
				return consonants[c] .. 'a'
			else
				return consonants[c] .. diacritics[d]
			end
		end)

	text = mw.ustring.gsub(text, '.', tt)
	if (lang == 'sa' or lang == 'pi') and mw.ustring.match(text, 'lฬฅ') then
		text = mw.ustring.gsub(text, 'lฬฅ', 'แธท')
		text = mw.ustring.toNFC(text)
	end

	return text
end
 
return export