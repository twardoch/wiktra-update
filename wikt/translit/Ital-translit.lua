local export = {}

-- Standard transcription
local common_rules = {
	['π'] = 'a',
	['π'] = 'b',
	['π'] = 'c',
	['π'] = 'd',
	['π'] = 'e',
	['π'] = 'v',
	['π'] = 'z',
	['π'] = 'h',
	['π'] = 'ΞΈ',
	['π'] = 'i',
	['π'] = 'k',
	['π'] = 'l',
	['π'] = 'm',
	['π'] = 'n',
	['π'] = 'Ε‘',
	['π'] = 'o',
	['π'] = 'p',
	['π'] = 'Ε',
	['π'] = 'q',
	['π'] = 'r',
	['π'] = 's',
	['π'] = 't',
	['π'] = 'u',
	['π'] = 'x',
	['π'] = 'Ο',
	['π'] = 'Ο',
	['π'] = 'f',
	['π'] = 'Ε',
	['π'] = 'Γ§',
	['π'] = 'Γ­',
	['π'] = 'ΓΊ',
	['π'] = 'k',
	-- Numerals
	['π '] = 'β ',
	['π‘'] = 'β€',
	['π’'] = 'β©',
	['π£'] = 'β¬',
	-- Punctuation
	['Β·'] = ' ',
	['β'] = ' ',
	['β'] = ' ',
}

local lang_rules = {
	['ett'] = {		-- Etruscan
		['π'] = 'β­',
	};

	['itc-ola'] = {		-- Old Latin
		['π'] = 'f',
	};

	['nrc'] = {		-- Noric
		['π'] = 'g',
		['π'] = 'd',
		['π'] = 'g',
	};
	
	['nrp'] = {		-- North Picene
		['π'] = 'g',
	};

	['osc'] = {		-- Oscan
		['π'] = 'g',
	};

	['spx'] = {		-- South Picene
		['π'] = 'g',
		['π'] = 'Γ­',
		['Β·'] = 'o',
		['β'] = 'f',
	};
	
	['xcc'] = {		-- Camunic
		['π'] = 'Ε',
		['π'] = 'g',
		['π'] = 'b',
		['π'] = 's',
		['π'] = 'ΓΎΓΎ',
		['π£'] = 'ΓΎ',
	};
	
	['xrr'] = {		-- Raetic
		['π'] = 'ΓΎ',
		['π'] = '?',
	};
	
	['xum'] = {		-- Umbrian
		['π'] = 't',
	};
	
	['xve'] = {		-- Venetic
		['π'] = 'j',
		['π'] = 'd',
		['ππ'] = 'f',
		['π'] = 'b',
		['π'] = 'g',
	};
}

function export.tr(text, lang, sc)
	-- If the script is not Ital, do not transliterate
	if sc ~= "Ital" then
		return
	end
	
	-- Transliterate language-specific exceptions
	if lang == "xve" then
		text = mw.ustring.gsub(text, 'ππ', 'f')
	end
	
	if lang_rules[lang] then
		text = mw.ustring.gsub(text, '.', lang_rules[lang])
	end
	
	-- Transliterate remaining characters
	text = mw.ustring.gsub(text, '.', common_rules)
	
	return text
end

return export