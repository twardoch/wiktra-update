local export = {}

local tt = {
	['ᱛ'] = 't', ['ᱜ'] = 'g', ['ᱝ'] = 'ṅ', ['ᱞ'] = 'l',
	['ᱠ'] = 'k', ['ᱡ'] = 'j', ['ᱢ'] = 'm', ['ᱣ'] = 'w',
	['ᱥ'] = 's', ['ᱦ'] = 'h', ['ᱧ'] = 'ñ', ['ᱨ'] = 'r',
	['ᱪ'] = 'c', ['ᱫ'] = 'd', ['ᱬ'] = 'ṇ', ['ᱭ'] = 'y',
	['ᱯ'] = 'p', ['ᱰ'] = 'ḍ', ['ᱱ'] = 'n', ['ᱲ'] = 'ṛ',
	['ᱴ'] = 'ṭ', ['ᱵ'] = 'b', ['ᱶ'] = 'v', ['ᱷ'] = 'ʰ',

	-- vowels
	['ᱚ'] = 'ô', ['ᱟ'] = 'a', ['ᱤ'] = 'i', ['ᱩ'] = 'u', ['ᱮ'] = 'e', ['ᱳ'] = 'o',
	['ᱚᱹ'] = 'ô', ['ᱟᱹ'] = 'ə', ['ᱮᱹ'] = 'ɛ',
	['ᱚᱺ'] = 'ỗ', ['ᱟᱺ'] = 'ə̃', ['ᱮᱺ'] = 'ɛ̃',

	-- special stuff   
	['ᱸ']='̃',

	--numerals
	['᱐']='0', ['᱑']='1', ['᱒']='2', ['᱓']='3', ['᱔']='4', ['᱕']='5', ['᱖']='6', ['᱗']='7', ['᱘']='8', ['᱙']='9',

	--punctuation
	['᱾'] = '.', ['᱿'] = '.',
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(text, '([᱐᱑᱒᱓᱔᱕᱖᱗᱘᱙ᱚᱛᱜᱝᱞᱟᱠᱡᱢᱣᱤᱥᱦᱧᱨᱩᱪᱫᱬᱭᱮᱯᱰᱱᱲᱳᱴᱵᱶᱷᱸᱻᱼᱽ᱾᱿]ᱹ?ᱺ?)', tt)
	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end
 
return export