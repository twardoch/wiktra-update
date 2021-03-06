local export = {}
local gsub = mw.ustring.gsub
local u = mw.ustring.char

-- Beware! Phnx is rtl
local tt = {
	['π€'] = 'ΚΎ', ['π€'] = 'b', ['π€'] = 'g', ['π€'] = 'd', ['π€'] = 'h',
	['π€'] = 'w', ['π€'] = 'z', ['π€'] = 'αΈ₯', ['π€'] = 'αΉ­', ['π€'] = 'y',
	['π€'] = 'k', ['π€'] = 'l', ['π€'] = 'm', ['π€'] = 'n', ['π€'] = 's',
	['π€'] = 'ΚΏ', ['π€'] = 'p', ['π€'] = 'αΉ£', ['π€'] = 'q', ['π€'] = 'r',
	['π€'] = 'Ε‘', ['π€'] = 't',
	['π€'] = '[1]', ['π€'] = '[10]', ['π€'] = '[20]', ['π€'] = '[100]',
	['π€'] = '[2]', ['π€'] = '[3]', ['π€'] = ' ',
}

function export.tr(text, lang, sc, debug_mode)

	if type(text) == 'table' then -- called directly from a template
		text = text.args[1]
	end

	return (text:gsub('[%z\1-\127\194-\244][\128-\191]*', tt)) -- UTF-8 character pattern
end

return export