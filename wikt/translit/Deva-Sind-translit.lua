local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
	['เค']='๐บ', ['เค']='๐ป', ['เค']='๐ผ', ['เฅป']='๐ฝ', ['เค']='๐พ', 
	['เค']='๐ฟ', ['เค']='๐', ['เค']='๐', ['เค']='๐', ['เฅผ']='๐',
	['เค']='๐', ['เค']='๐', ['เค']='๐', ['เค ']='๐', ['เคก']='๐',
	['เฅพ']='๐', ['เคข']='๐', ['เคฃ']='๐', ['เคค']='๐', ['เคฅ']='๐', 
	['เคฆ']='๐', ['เคง']='๐', ['เคจ']='๐', ['เคช']='๐', ['เคซ']='๐', 
	['เคฌ']='๐', ['เฅฟ']='๐', ['เคญ']='๐', ['เคฎ']='๐', ['เคฏ']='๐', 
	['เคฐ']='๐', ['เคฒ']='๐', ['เคต']='๐', ['เคถ']='๐', ['เคธ']='๐',
	['เคน']='๐', 
	['เคกเคผ']='๐', ['เคเคผ']='๐ป๐ฉ', ['เคเคผ']='๐ผ๐ฉ', ['เคเคผ']='๐บ๐ฉ', ['เค']='๐๐ฉ',

	['เคพ']='๐ ', ['เคฟ']='๐ก', ['เฅ']='๐ข', ['เฅ']='๐ฃ', ['เฅ']='๐ค', ['เฅ']='๐ฅ', ['เฅ']='๐ฆ', ['เฅ']='๐ง', ['เฅ']='๐จ',  ['เฅ']='๐ช', ['เคผ']='๐ฉ',
['๐๐ฉ']='๐',

	-- vowels
	['เค']='๐ฐ', ['เค']='๐ฑ', ['เค']='๐ฒ', ['เค']='๐ณ', ['เค']='๐ด', ['เค']='๐ต', ['เค']='๐ถ', ['เค']='๐ท', ['เค']='๐ธ', ['เค']='๐น', 

	-- anusvara    
	['เค']='๐',
}
function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		".เคผ?",
		function(c)
			return conv[c]
		end)

	return text
end
 
return export