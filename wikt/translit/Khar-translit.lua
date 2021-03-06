local export = {}
local u = mw.ustring.char
local gsub = mw.ustring.gsub

local consonants = {
--defer transliteration of null consonant.
	['ð¨'] = 'ð¨',
--consonants
	['ð¨']='k', ['ð¨']='kh', ['ð¨']='g', ['ð¨']='gh',
	['ð¨']='c', ['ð¨']='ch', ['ð¨']='j', ['ð¨']='Ã±', 
	['ð¨']='á¹­', ['ð¨']='á¹­h', ['ð¨']='á¸', ['ð¨']='á¸h', ['ð¨']='á¹', 
	['ð¨']='t', ['ð¨ ']='th', ['ð¨¡']='d', ['ð¨¢']='dh', ['ð¨£']='n', 
	['ð¨¤']='p', ['ð¨¥']='ph', ['ð¨¦']='b', ['ð¨§']='bh', ['ð¨¨']='m',
	['ð¨©']='y', ['ð¨ª']='r',  ['ð¨«']='l', ['ð¨¬']='v',
	['ð¨­']='Å', ['ð¨®']='á¹£',  ['ð¨¯']='s', ['ð¨°']='z', ['ð¨±']='h',
	['ð¨²']='á¸±', ['ð¨³']='á¹­Ìh', ['ð¨´']='á¹­Ì', ['ð¨µ']='vh',
}

local diacritics = {
--matras
	['ð¨']='i', ['ð¨']='u', ['ð¨']='á¹',
	['ð¨']='e', ['ð¨']='o', ['ð¨']='Ä',
	['ð¨ð¨']='Ä«', ['ð¨ð¨']='Å«', ['ð¨ð¨']='á¹',
	['ð¨ð¨']='ai', ['ð¨ð¨']='au', ['ð¨¿']='', ['âð¨¿']='â¿',
	['ð¨'] = 'aÍ', ['ð¨ð¨'] = 'uÍ',
}

local tt = {

	--vowels
	['ð¨'] = '',
	-- anusvara    
	['ð¨']='á¹', --until a better method is found
	-- visarga    
	['ð¨']='á¸¥',
	--numerals
	['ð©']='1', ['ð©']='2', ['ð©']='3', ['ð©']='4',
['ð©']='10', ['ð©']='20', ['ð©']='100', ['ð©']='1000', 
	--punctuation        
	['ð©']='.', --danda
    ['ð©']='.', --double danda
}

function export.tr(text, lang, sc)
	local failed = nil
	if sc ~= "Khar" then
		return nil
	end
-- Consonants appear as part of sequences canonically equivalent to consonant+nukta+vowel, so
-- allowing for multiplicity and the string being normalised (by Wikimedia policy), the matching
-- RE is:
	local form = '([ð¨ð¨-ð¨µ])(ð¨¹?)(â?ð¨¿?)(ð¨º?)(ð¨?)(ð¨¸?)([ð¨-ð¨]?[ð¨-ð¨]?ð¨?ð¨?)'
	text = gsub(text, form, function(c, n1, h, n2, vi, n3, vm)
		local d = h..vi..vm -- Expect at most one catenand to be non-empty.
		local cdia = ''
		local cons = consonants[c]
		local retval
		if n1 ~= '' then -- Cauda
			if cons == 's' or cons == 'Å' then
				cdia = cdia .. u(0x0331) -- Combining macron below
			else
				cdia = cdia .. u(0x0301) -- Combining acute
			end
		end
		if n2 ~= '' then cdia = cdia .. u(0x0323) end -- Combining dot below
		if n3 ~= '' then cdia = cdia .. u(0x0304) end -- Combining macron
		if d == "" then
			retval = cons .. cdia .. 'a'
		else
			local dia = diacritics[d]
			if not dia then
				mw.addWarning('Failed to transliterate ð¨' .. d .. ' in ' .. text)
				failed = true
				dia = 'D'
			end
			retval = cons .. cdia .. dia
		end
		return mw.ustring.toNFD(retval)
	end)

	text = gsub(text, "(a)ð¨([iu])", "%1%2"..u(0x308)) -- Apply diaeresis
	text = gsub(text, '.', tt)
	text = gsub(text, 'lâ¿y', 'lÃ½')
	text = gsub(text, 'â¿', '')
	text = gsub(text, u(0x301, 0x304), u(0x304, 0x301))
	
	if failed then return nil end
	return mw.ustring.toNFC(text)
end
 
return export