local export = {}

local letters = {
	["А"] = "A", ["а"] = "a",
	["Б"] = "B", ["б"] = "b",
	["В"] = "V", ["в"] = "v",
	["Г"] = "G", ["г"] = "g",
	["Д"] = "D", ["д"] = "d",
	["Е"] = "E", ["е"] = "e",
	["Ё"] = "Jo", ["ё"] = "jo",
	["Ж"] = "Ž", ["ж"] = "ž",
	["З"] = "Z", ["з"] = "z",
	["И"] = "I", ["и"] = "i",
	["Й"] = "J", ["й"] = "j",
	["К"] = "K", ["к"] = "k",
	["Ӄ"] = "Q", ["ӄ"] = "q",
	["Л"] = "l", ["л"] = "l",
	["Ԓ"] = "Ḷ", ["ԓ"] = "ḷ",
	["М"] = "M", ["м"] = "m",
	["Н"] = "N", ["н"] = "n",
	["Ӈ"] = "Ṇ", ["ӈ"] = "ṇ",
	["О"] = "O", ["о"] = "o",
	["П"] = "P", ["п"] = "p",
	["Р"] = "R", ["р"] = "r",
	["С"] = "S", ["с"] = "s",
	["Т"] = "T", ["т"] = "t",
	["У"] = "U", ["у"] = "u",
	["Ф"] = "F", ["ф"] = "f",
	["Х"] = "H", ["х"] = "h",
	["Ц"] = "C", ["ц"] = "c",
	["Ч"] = "Č", ["ч"] = "č",
	["Ш"] = "Š", ["ш"] = "š",
	["Щ"] = "Šč", ["щ"] = "šč",
	["Ъ"] = "ʺ", ["ъ"] = "ʺ",
	["Ы"] = "Y", ["ы"] = "y",
	["Ь"] = "ʹ", ["ь"] = "ʹ",
	["Э"] = "Ė", ["э"] = "ė",
	["Ю"] = "Ju", ["ю"] = "ju",
	["Я"] = "Ja", ["я"] = "ja",
	["ʼ"] = "ʼ", -- No change
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(text, ".", letters)
	return text
end

return export