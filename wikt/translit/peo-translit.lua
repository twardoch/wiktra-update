local export = {}

local alphabetic_tt = {
	-- this should only contain alphabetic characters
	["๐ "] = "a",
	["๐ก"] = "i",
	["๐ข"] = "u",
	["๐ฃ"] = "k",
	["๐ค"] = "ku",
	["๐ฅ"] = "g",
	["๐ฆ"] = "gu",
	["๐ง"] = "x",
	["๐จ"] = "c",
	["๐ฉ"] = "j",
	["๐ช"] = "ji",
	["๐ซ"] = "t",
	["๐ฌ"] = "tu",
	["๐ญ"] = "d",
	["๐ฎ"] = "di",
	["๐ฏ"] = "du",
	["๐ฐ"] = "ฮธ",
	["๐ฑ"] = "p",
	["๐ฒ"] = "b",
	["๐ณ"] = "f",
	["๐ด"] = "n",
	["๐ต"] = "nu",
	["๐ถ"] = "m",
	["๐ท"] = "mi",
	["๐ธ"] = "mu",
	["๐น"] = "y",
	["๐บ"] = "v",
	["๐ป"] = "vi",
	["๐ผ"] = "r",
	["๐ฝ"] = "ru",
	["๐พ"] = "l",
	["๐ฟ"] = "s",
	["๐"] = "z",
	["๐"] = "ลก",
	["๐"] = "รง",
	["๐"] = "h",
	["๐"] = "AM", -- Auramazdฤ
	["๐"] = "AM", -- Auramazdฤ
	["๐"] = "AMha", -- Auramazdฤha
	["๐"] = "Xล ", -- xลกฤyathiya 
	["๐"] = "DH", -- dahyฤuลก
	["๐"] = "DH", -- dahyฤuลก
	["๐"] = "BG", -- baga
	["๐"] = "BU", -- bลซmiลก
}

local nonalphabetic_tt = {
	["๐"] = " : ", --word divider
}

local numbers = {
	["๐"] = 1,
	["๐"] = 2,
	["๐"] = 10,
	["๐"] = 20,
	["๐"] = 100,
}

function export.convert_numbers(numeric_str)
	local total = 0
	for c in mw.ustring.gmatch(numeric_str, ".") do
		total = total + numbers[c]
	end
	return total
end

function export.tr(text, lang, sc)
	-- If the script is not Xpeo, do not transliterate
	if sc ~= "Xpeo" then
		return
	end
	
	local t = {}
	local preceding_num = false
	local need_hyphen = false
	-- Transliterate characters
	text = mw.ustring.gsub(text,
		".",
		function(c)
			if alphabetic_tt[c] then
				if need_hyphen then
					t[#t + 1] = "-"
				end
				t[#t + 1] = alphabetic_tt[c]
				need_hyphen = true
			else
				need_hyphen = false
				if numbers[c] then
					if preceding_num then
						t[#t] = t[#t] + numbers[c]
					else
						t[#t + 1] = numbers[c]
					end
					preceding_num = true
				else
					preceding_num = false
					t[#t + 1] = nonalphabetic_tt[c] or c
				end
			end
		end)

	return table.concat(t)
end

return export