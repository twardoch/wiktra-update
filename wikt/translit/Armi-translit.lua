local export = {}

local tt = {
	["π‘"] = "ΚΎ", -- aleph
	["π‘"] = "b", -- beth
	["π‘"] = "g", -- gimel
	["π‘"] = "d", -- daleth
	["π‘"] = "h", -- he
	["π‘"] = "w", -- waw
	["π‘"] = "z", -- zayin
	["π‘"] = "αΈ₯", -- heth
	["π‘"] = "αΉ­", -- teth
	["π‘"] = "y", -- yodh
	["π‘"] = "k", -- khaph
	["π‘"] = "l", -- lamedh
	["π‘"] = "m", -- mem
	["π‘"] = "n", -- nun
	["π‘"] = "s", -- samekh
	["π‘"] = "ΚΏ", -- ayin
	["π‘"] = "p", -- pe
	["π‘"] = "αΉ£", -- sadhe
	["π‘"] = "q", -- qoph
	["π‘"] = "r", -- resh
	["π‘"] = "Ε‘", -- shin
	["π‘"] = "t", -- taw
	["π‘"] = "|", -- section sign
	["π‘"] = "1", -- one
	["π‘"] = "2", -- two
	["π‘"] = "3", -- three
	["π‘"] = "10", -- ten
	["π‘"] = "20", -- twenty
	["π‘"] = "100", -- one hundred
	["π‘"] = "1000", -- one thousand
	["π‘"] = "10000", -- ten thousand
}

function export.tr(text, lang, sc)
	
	if sc ~= "Armi" then
		return
	end

	-- Transliterate characters
	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end

return export