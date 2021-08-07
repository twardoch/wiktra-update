local export = {}

local mapping1 = {
	["п"] = "p", ["б"] = "b",
	["т"] = "t", ["д"] = "d",
	["к"] = "k", ["г"] = "g",
	["ц"] = "c", ["ч"] = "č",
	["с"] = "s", ["з"] = "z", ["ш"] = "š", ["ж"] = "ž", ["х"] = "x",
	["м"] = "m", ["н"] = "n",
	["р"] = "r", ["л"] = "l",
	["в"] = "v", ["й"] = "y",
	["и"] = "i", ["е"] = "e", ["э"] = "e", ["а"] = "a", ["о"] = "o", ["у"] = "u",
	["ъ"] = "ʾ", ["ᵸ"] = "̃",
}

local mapping2 = {
	["пӏ"] = "p’", ["тӏ"] = "t’", ["кӏ"] = "k’", ["къ"] = "q’",
	["цӏ"] = "c’", ["лӏ"] = "ƛ", ["кь"] = "ƛ’", ["чӏ"] = "c’̌", ["хъ"] = "q",
	["лъ"] = "λ", ["гъ"] = "ġ", ["хӏ"] = "ḥ", ["гӏ"] = "a̯", ["гь"] = "h",
	["аь"] = "ä", ["оь"] = "ö", ["уь"] = "ü", ["аᵸ"] = "ã", ["еᵸ"] = "ẽ", ["иᵸ"] = "ĩ", ["оᵸ"] = "õ", ["уᵸ"] = "ũ",
}

local tetragraph = {
	["аьᵸ"] = "ä̃",
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8_char = "[%z\1-\127\194-\244][\128-\191]*"
	
	-- Convert capital to lowercase palochka.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for pat, repl in pairs(mapping2) do
		text = str_gsub(text, pat, repl)
	end

	for tetragraph, replacement in pairs(tetragraph) do
		text = str_gsub(text, tetragraph, replacement)
	end

	text = str_gsub(text, UTF8_char, mapping1)

	return text
end

return export