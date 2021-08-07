local u = mw.ustring.char

local export = {}

local CARONBELOW = u(0x032c)
 
local rsub = mw.ustring.gsub

local tt = {
	["А"]="A", ["а"]="a", ["Ӑ"]="Ă", ["ӑ"]="ă", ["Б"]="B", ["б"]="b", ["В"]="V", ["в"]="v", ["Г"]="G", ["г"]="g",
	["Д"]="D", ["д"]="d", ["Е"]="E", ["е"]="e", ["Ё"]="Jo", ["ё"]="jo", ["Ӗ"]="Ĕ", ["ӗ"]="ĕ", ["Ж"]="Ž", ["ж"]="ž",
	["З"]="Z", ["з"]="z", ["И"]="I", ["и"]="i", ["Й"]="J", ["й"]="j", ["К"]="K", ["к"]="k", ["Л"]="L", ["л"]="l",
	["М"]="M", ["м"]="m",["Н"]="N", ["н"]="n", ["О"]="O", ["о"]="o", ["П"]="P", ["п"]="p", ["Р"]="R", ["р"]="r",
	["С"]="S", ["с"]="s", ["Ҫ"]="Ś", ["ҫ"]="ś", ["Т"]="T", ["т"]="t", ["У"]="U", ["у"]="u", ["Ӳ"]="Ü", ["ӳ"]="ü",
	["Ф"]="F", ["ф"]="f", ["Х"]="H", ["х"]="h", ["Ц"]="Ts", ["ц"]="ts", ["Ч"]="Č", ["ч"]="č", ["Ш"]="Š", ["ш"]="š",
	["Щ"]="Šč", ["щ"]="šč", ["Ъ"]="ʺ", ["ъ"]="ʺ", ["Ы"]="Y", ["ы"]="y", ["Ь"]="ʹ", ["ь"]="ʹ", ["Э"]="E", ["э"]="e",
	["Ю"]="Ju", ["ю"]="ju", ["Я"]="Ja", ["я"]="ja"
};

local VOWEL1 = "[АӐЕЁӖИОУӲЫЭЮЯМНЛРЙаӑеёӗиоуӳыэюямнлрй]"
local CONS = "[КХПТСШҪЧкхптсшҫч]"
local VOWEL2 = "[АӐЕЁӖИОУӲЫЭЮЯаӑеёӗиоуӳыэюя]"
local CHARC = "[ '-]"

function export.tr(text, lang, sc)
	text = rsub(text, "(" .. VOWEL1 .. CHARC .. "?" .. CONS .. ")(" .. CHARC .. "?)%f" .. VOWEL2, "%1" .. CARONBELOW .. "%2")
    text = rsub(text, ".", tt)
    return text
end

return export