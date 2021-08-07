local export = {}

local mapping1 = {
	["а"]="a", ["б"]="b", ["в"]="v", ["г"]="g", ["д"]="d", ["е"]="e", ["ё"]="ë", ["ж"]="ž", ["з"]="z", 
	["и"]="i", ["й"]="j", ["к"]="k", ["л"]="l", ["м"]="m", ["н"]="n", ["о"]="o", 
	["п"]="p", ["р"]="r", ["с"]="s", ["т"]="t",  ["у"]="w", ["ф"]="f", ["х"]="x", ["ц"]="c",  ["ч"]="č̍", 
	["ш"]="š", ["щ"]="š̍", ["ъ"]="ʾ", ["ы"]="ə", ["ь"]="’", ["э"]="è", 
	["ю"]="ju", ["я"]="ja", ["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="E", ["Ё"]="Ë", ["Ж"]="Ž", ["З"]="Z", 
	["И"]="I", ["Й"]="J", ["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["О"]="O", 
	["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T",  ["У"]="W", ["Ф"]="F", ["Х"]="X", ["Ц"]="C",  ["Ч"]="Č̍", 
	["Ш"]="Š", ["Щ"]="Š̍", ["Ъ"]="ʾ", ["Ы"]="Ə", ["Ь"]="’", ["Э"]="È", 
	["Ю"]="Ju", ["Я"]="Ja"};

local mapping2 = {
	['Хъв'] = 'Q°',
	['Гӏв'] = 'ʿ°',
	['Гъв'] = 'Ğ°',
	['Гъь'] = 'Ğ̍',
	['Джв'] = 'Ǯ°',
	['Джь'] = 'Ǯ̍',
	['Къв'] = 'Q̇°',
	['Къь'] = 'Q̇̍',
	['Кӏв'] = 'Ḳ°',
	['Кӏь'] = 'Ḳ̍',
	['Хӏв'] = 'Ḥ°',
	['Чӏв'] = 'Č̣°',
	['хъв'] = 'q°',
	['гӏв'] = 'ʿ°',
	['гъв'] = 'ğ°',
	['гъь'] = 'ğ̍',
	['джв'] = 'ǯ°',
	['джь'] = 'ǯ̍',
	['къв'] = 'q̇°',
	['къь'] = 'q̇̍',
	['кӏв'] = 'ḳ°',
	['кӏь'] = 'ḳ̍',
	['хӏв'] = 'ḥ°',
	['чӏв'] = 'č̣°',  
	['гв'] = 'g°',
	['гъ'] = 'ğ',
	['гь'] = 'g̍',
	['гӏ'] = 'ʿ',
	['дж'] = 'ǯ',
	['дз'] = 'ʒ',
	['жв'] = 'ž°',
	['жь'] = 'ž̍',
	['кв'] = 'k°',
	['къ'] = 'q̇',
	['кь'] = 'k̍',
	['кӏ'] = 'ḳ',
	['тл'] = 'ł',
	['тш'] = 'č',
	['тӏ'] = 'ṭ',
	['пӏ'] = 'ṗ',
	['хв'] = 'x°',
	['хь'] = 'x̍',
	['хӏ'] = 'ḥ',
	['цӏ'] = 'c̣',
	['чв'] = 'č°',
	['чӏ'] = 'č̣̍',
	['шӏ'] = 'č̣',
	['шв'] = 'š°',
	['ль'] = 'l',
	['лӏ'] = 'ḷ',
	['хъ'] = 'q',
	['фӏ'] = 'f̣',
	['Гв'] = 'G°',
	['Гъ'] = 'Ğ',
	['Гь'] = 'G̍',
	['Гӏ'] = 'ʿ',
	['Дж'] = 'Ǯ',
	['Дз'] = 'Ʒ',
	['Жв'] = 'Ž°',
	['Жь'] = 'Ž̍',
	['Кв'] = 'K°',
	['Къ'] = 'Q̇',
	['Кь'] = 'K̍',
	['Кӏ'] = 'Ḳ',
	['Тл'] = 'Ł',
	['Тш'] = 'Č',
	['Тӏ'] = 'Ṭ',
	['Пӏ'] = 'Ṗ',
	['Хв'] = 'X°',
	['Хь'] = 'X̍',
	['Хӏ'] = 'Ḥ',
	['Цӏ'] = 'C̣',
	['Чв'] = 'Č°',
	['Чӏ'] = 'Č̣̍',
	['Шӏ'] = 'Č̣',
	['Шв'] = 'Š°',
	['Ль'] = 'L',
	['Лӏ'] = 'Ḷ',
	['Хъ'] = 'Q',
	['Фӏ'] = 'F̣',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8char = '[\1-\127\194-\244][\128-\191]*'
	
	-- Convert uppercase palochka to lowercase. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	-- These two can use the basic string function.
	for pat, repl in pairs(mapping2) do
		text = str_gsub(text, pat, repl)
	end
	
	text = str_gsub(text, UTF8char, mapping1)
	
	return text
end

return export