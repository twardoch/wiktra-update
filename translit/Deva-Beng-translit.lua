local export = {}
local U = mw.ustring.char
local gsub = mw.ustring.gsub
local match = mw.ustring.match
local sub = mw.ustring.sub

local conv = {
		["क"] = "ক", ["ख"] = "খ", ["ग"] = "গ", ["घ"] = "ঘ", ["ङ"] = "ঙ", 
		["च"] = "চ", ["छ"] = "ছ", ["ज"] = "জ", ["झ"] = "ঝ", ["ञ"] = "ঞ", 
		["ट"] = "ট", ["ठ"] = "ঠ", ["ड"] = "ড", ["ढ"] = "ঢ", ["ण"] = "ণ", 
		["त"] = "ত", ["थ"] = "থ", ["द"] = "দ", ["ध"] = "ধ", ["न"] = "ন", 
		["प"] = "প", ["फ"] = "ফ", ["ब"] = "ব", ["भ"] = "ভ", ["म"] = "ম", 
		["य"] = "য", ["र"] = "র", ["ल"] = "ল", ["व"] = "ব", -- ["ळ"] = "ळ", 
		["श"] = "শ", ["ष"] ="ষ", ["स"] = "স", ["ह"] = "হ",
	
		["अ"] = "অ", ["आ"] = "আ", ["इ"] = "ই", ["ई"] = "ঈ", ["उ"] = "উ", ["ऊ"] = "ঊ", ["ऋ"] = "ঋ", ["ॠ"] = "ৠ",
		["ऌ"] = "ঌ", ["ॡ"] = "ৡ", ["ए"] = "এ", ["ऐ"] = "ঐ", ["ओ"] = "ও", ["औ"] = "ঔ",
		
		["ा"] = "া", ["ि"] = "ি", ["ी"] = "ী", ["ु"] = "ু", ["ू"] = "ূ", ["ृ"] = "ৃ", ["ॄ"] = "ৄ", 
		["ॢ"] = "ৢ", ["ॣ"] = "ৣ", ["े"] = "ে", ["ै"] = "ৈ", ["ो"] = "ো", ["ौ"] = "ৌ",  ["्"] = "্",
	
		["ँ"] = "ঁ", ["ं"] = "ং", ["ः"] = "ঃ", ["ऽ"] = "ঽ",

		["०"] = "০", ["१"] = "১", ["२"] = "২", ["३"] = "৩", ["४"] = "৪", ["५"] = "৫", ["६"] = "৬", ["७"] = "৭", ["८"] = "৮", ["९"] = "৯",
	        
	    ["॥"] = "॥", ["।"] = "।",
	    
	    -- ["ᳵ"] = "ᳵ", ["ᳶ"] = "ᳶ",
    
		["ॐ"] = "ওঁ",
    	
    	["*"] = "*",
}

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		".",
		function(c)
			return conv[c]
		end)
        --text = mw.ustring.gsub(text, '𑑄$', "𑑈")
	return text
end
 
return export