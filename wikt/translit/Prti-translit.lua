local export = {}

local tt = {
	['π­'] = 'ΚΎ',
	['π­'] = 'b',
	['π­'] = 'g',
	['π­'] = 'd',
	['π­'] = 'h',
	['π­'] = 'w',
	['π­'] = 'z',
	['π­'] = 'αΈ₯',
	['π­'] = 'αΉ­',
	['π­'] = 'y',
	['π­'] = 'k',
	['π­'] = 'l',
	['π­'] = 'm',
	['π­'] = 'n',
	['π­'] = 's',
	['π­'] = 'ΚΏ',
	['π­'] = 'p',
	['π­'] = 'c',
	['π­'] = 'q',
	['π­'] = 'r',
	['π­'] = 'Ε‘',
	['π­'] = 't',
}

local numbers = {
	['π­'] = 1,
	['π­'] = 2,
	['π­'] = 3,
	['π­'] = 4,
	['π­'] = 10,
	['π­'] = 20,
	['π­'] = 100,
	['π­'] = 1000,
}


function export.convert_numbers(numeric_str)
	local total = 0
	for c in mw.ustring.gmatch(numeric_str, ".") do
		total = total + numbers[c]
	end
	return total
end


function export.tr(text, lang, sc)
	-- If the script is not Prti, do not transliterate
	if sc ~= "Prti" then
		return
	end
	
	if mw.ustring.match(text, '[π­-π­]') then
		text = mw.ustring.gsub(text, '[π­-π­]+', export.convert_numbers)
	end
	
	-- Transliterate characters
	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end

return export