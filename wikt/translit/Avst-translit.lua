local export = {}

local mapping = {
	["ð¬"] = "a", -- AVESTAN LETTER A 
	["ð¬"] = "Ä", -- AVESTAN LETTER AA 
	["ð¬"] = "Ã¥", -- AVESTAN LETTER AO 
	["ð¬"] = "ÄÌ", -- AVESTAN LETTER AAO 
	["ð¬"] = "Ä", -- AVESTAN LETTER AN 
	["ð¬"] = "ÄÌÌ", -- AVESTAN LETTER AAN 
	["ð¬"] = "É", -- AVESTAN LETTER AE 
	["ð¬"] = "ÉÌ", -- AVESTAN LETTER AEE 
	["ð¬"] = "e", -- AVESTAN LETTER E 
	["ð¬"] = "Ä", -- AVESTAN LETTER EE 
	["ð¬"] = "o", -- AVESTAN LETTER O 
	["ð¬"] = "Å", -- AVESTAN LETTER OO 
	["ð¬"] = "i", -- AVESTAN LETTER I 
	["ð¬"] = "Ä«", -- AVESTAN LETTER II 
	["ð¬"] = "u", -- AVESTAN LETTER U 
	["ð¬"] = "Å«", -- AVESTAN LETTER UU 
	
	["ð¬"] = "k", -- AVESTAN LETTER KE 
	["ð¬"] = "x", -- AVESTAN LETTER XE 
	["ð¬"] = "xÌ", -- AVESTAN LETTER XYE 
	["ð¬"] = "xáµ", -- AVESTAN LETTER XVE
	["ð¬"] = "g", -- AVESTAN LETTER GE 
	["ð¬"] = "Ä¡", -- AVESTAN LETTER GGE 
	["ð¬"] = "Î³", -- AVESTAN LETTER GHE 
	["ð¬"] = "c", -- AVESTAN LETTER CE 
	["ð¬"] = "j", -- AVESTAN LETTER JE 
	["ð¬"] = "t", -- AVESTAN LETTER TE 
	["ð¬"] = "Î¸", -- AVESTAN LETTER THE 
	["ð¬"] = "d", -- AVESTAN LETTER DE 
	["ð¬"] = "Î´", -- AVESTAN LETTER DHE 
	["ð¬"] = "tÌ°", -- AVESTAN LETTER TTE 
	["ð¬"] = "p", -- AVESTAN LETTER PE 
	["ð¬"] = "f", -- AVESTAN LETTER FE 
	["ð¬ "] = "b", -- AVESTAN LETTER BE 
	["ð¬¡"] = "Î²", -- AVESTAN LETTER BHE 
	["ð¬¢"] = "Å", -- AVESTAN LETTER NGE 
	["ð¬£"] = "ÅÌ", -- AVESTAN LETTER NGYE 
	["ð¬¤"] = "Åáµ", -- AVESTAN LETTER NGVE
	["ð¬¥"] = "n", -- AVESTAN LETTER NE 
	["ð¬¦"] = "Å", -- AVESTAN LETTER NYE 
	["ð¬§"] = "á¹", -- AVESTAN LETTER NNE 
	["ð¬¨"] = "m", -- AVESTAN LETTER ME 
	["ð¬©"] = "mÌ¨", -- AVESTAN LETTER HME 
	["ð¬ª"] = "áº", -- AVESTAN LETTER YYE 
	["ð¬«"] = "y", -- AVESTAN LETTER YE 
	["ð¬¬"] = "v", -- AVESTAN LETTER VE 
	["ð¬­"] = "r", -- AVESTAN LETTER RE 
	["ð¬®"] = "l", -- AVESTAN LETTER LE 
	["ð¬¯"] = "s", -- AVESTAN LETTER SE 
	["ð¬°"] = "z", -- AVESTAN LETTER ZE 
	["ð¬±"] = "Å¡", -- AVESTAN LETTER SHE 
	["ð¬²"] = "Å¾", -- AVESTAN LETTER ZHE 
	["ð¬³"] = "Å¡Ì", -- AVESTAN LETTER SHYE 
	["ð¬´"] = "á¹£Ì", -- AVESTAN LETTER SSHE 
	["ð¬µ"] = "h", -- AVESTAN LETTER HE 
	["ð¬¹"] = " ", -- AVESTAN ABBREVIATION MARK
	["â¸±"] = "."  -- WORD SEPARATOR MIDDLE DOT
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(text, "[â¸±ð¬¹]?[ð¬ºð¬»ð¬¼ð¬½ð¬¾ð¬¿]", ".") -- punctuation
	text = string.gsub(text, "[\1-\127\194-\244][\128-\191]*", mapping) -- transliterate letters
	--text = mw.ustring.gsub(text, "ii", "y")
	--text = mw.ustring.gsub(text, "uu", "v")
	
	text = mw.ustring.gsub(text,"([aÄÉÅ])rÉ([kxgÎ³cjtÎ¸Î´pfbÎ²nmrlszÅ¡Å¾])", "%1r<sup><small>É</small></sup>%2") -- r > rÉ /V_C
	text = mw.ustring.gsub(text,"([aÄÉÅ])rÉ$", "%1r<sup><small>É</small></sup>") -- r > rÉ /V_#
	
	text = mw.ustring.gsub(text,"([aÄeÄÉoÅuÅ«])i(rm[eiÄ«])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
	text = mw.ustring.gsub(text,"([aÄeÄÉoÅuÅ«])i(á¹t[eiÄ«])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
	text = mw.ustring.gsub(text,"([aÄeÄÉoÅuÅ«])i([kxgÎ³tÎ¸Î´pfbÎ²nrl][eiÄ«])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
	text = mw.ustring.gsub(text,"(%.%s)i([Î¸r][iÄ«])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
	text = mw.ustring.gsub(text,"^i([Î¸r][iÄ«])", "<sup><small>i</small></sup>%1") -- i-epenthesis
	
	text = mw.ustring.gsub(text,"([aÄeÄÉiÄ«oÅ])u(r[ouÅ«])", "%1<sup><small>u</small></sup>%2") -- u-epenthesis

	return text
end

return export