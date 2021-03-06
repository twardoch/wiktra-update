local export = {}

local tt = {
	["๐ผ"] = "สพ", -- aleph
	["๐ผ"] = "สพ", -- final aleph
	["๐ผ"] = "ฮฒ", -- beth
	["๐ผ"] = "ฮฒ", -- final beth
	["๐ผ"] = "ษฃ", -- gimel
	["๐ผ"] = "h", -- he
	["๐ผ"] = "h", -- final he
	["๐ผ"] = "w", -- waw
	["๐ผ"] = "z", -- zayin
	["๐ผ"] = "x", -- heth
	["๐ผ"] = "y", -- yodh
	["๐ผ"] = "k", -- kaph
	["๐ผ"] = "ฮด", -- lamedh
	["๐ผ"] = "m", -- mem
	["๐ผ"] = "n", -- nun
	["๐ผ"] = "n", -- final nun
	["๐ผ"] = "n", -- final nun with vertical tail
	["๐ผ"] = "s", -- samekh
	["๐ผ"] = "สฟ", -- ayin
	["๐ผ"] = "สฟD", -- alternative ayin
	["๐ผ"] = "p", -- pe
	["๐ผ"] = "c", -- sadhe
	["๐ผ"] = "c", -- final sadhe
	["๐ผ"] = "c", -- final sadhe with vertical tail
	["๐ผ"] = "r", -- resh-ayin-deleth
	["๐ผ"] = "ลก", -- shin
	["๐ผ"] = "t", -- taw
	["๐ผ"] = "t", -- final taw
	["๐ผ"] = "t", -- final taw with vertical tail
},
{
	["๐ผ"] = "1", -- one
	["๐ผ"] = "2", -- two
	["๐ผ"] = "3", -- three
	["๐ผ "] = "4", -- four
	["๐ผก"] = "5", -- five
	["๐ผข"] = "10", -- ten
	["๐ผฃ"] = "20", -- twenty
	["๐ผค"] = "30", -- thirty
	["๐ผฅ"] = "100", -- one hundred
	["๐ผฆ"] = "ยฝ", -- one half
},
{
	["๐ผง"] = "r", -- ayin-daleth ligature
}

function export.tr(text, lang, sc)
	-- If the script is not Sogd, do not transliterate
	if sc ~= "Sogo" then
		return
	end
	
	-- Transliterate characters
	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end

return export