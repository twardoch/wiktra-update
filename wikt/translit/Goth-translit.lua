local export = {}

local Goth_Latn = {
	["๐ฐ"] = "a",
	["๐ฑ"] = "b",
	["๐ฒ"] = "g",
	["๐ณ"] = "d",
	["๐ด"] = "ฤ",
	["๐ต"] = "q",
	["๐ถ"] = "z",
	["๐ท"] = "h",
	["๐ธ"] = "รพ",
	["๐น"] = "i",
	["๐บ"] = "k",
	["๐ป"] = "l",
	["๐ผ"] = "m",
	["๐ฝ"] = "n",
	["๐พ"] = "j",
	["๐ฟ"] = "u",
	["๐"] = "p",
	["๐"] = "?",
	["๐"] = "r",
	["๐"] = "s",
	["๐"] = "t",
	["๐"] = "w",
	["๐"] = "f",
	["๐"] = "x",
	["๐"] = "ฦ",
	["๐"] = "ล",
	["๐"] = "?",
}

local Latn_Goth = {
	["ฤ"] = "๐ฐ",
	["e"] = "๐ด",
	["ฤซ"] = "๐น",
	["o"] = "๐",
	["ลซ"] = "๐ฟ",
	["y"] = "๐",
	}

for g, l in pairs(Goth_Latn) do
	if l ~= "?" then
		Latn_Goth[l] = g
	end
end

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(text, "๐ด๐น", "ei")
	
	return (mw.ustring.gsub(text, '.', Goth_Latn))
end

function export.tr_reverse(text)
	text = mw.ustring.lower(text)
	return (mw.ustring.gsub(text, '.', Latn_Goth))
end

return export