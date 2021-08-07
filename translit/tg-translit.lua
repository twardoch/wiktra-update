local export = {}

local tt={
	["т"]="t",["Т"]="T",   ["р"]="r",["Р"]="R",   ["ф"]="f",["Ф"]="F",
	["ю"]="yu",["Ю"]="Yu", ["ш"]="š",["Ш"]="Š", ["ҳ"]="h",["Ҳ"]="H",   ["ъ"]="ʾ",["Ъ"]="ʾ", ["н"]="n",["Н"]="N", 
	["п"]="p",["П"]="P",   ["й"]="y",["Й"]="Y", ["л"]="l",["Л"]="L",   ["з"]="z",["З"]="Z", ["е"]="e",["Е"]="E", 
	["г"]="g",["Г"]="G",   ["б"]="b",["Б"]="B", ["у"]="u",["У"]="U",   ["с"]="s",["С"]="S", ["х"]="x",["Х"]="X",
	["ч"]="č",["Ч"]="Č",   ["я"]="ya",["Я"]="Ya",
	["м"]="m",["М"]="M",   ["о"]="o",["О"]="O", ["и"]="i",["И"]="I", ["ё"]="yo",["Ё"]="Yo", ["ж"]="ž",["Ж"]="Ž",
	["к"]="k",["К"]="K",   ["д"]="d",["Д"]="D", ["в"]="v",["В"]="V", ["а"]="a",["А"]="A",  ["ҷ"]="j",["Ҷ"]="J",
	["ӯ"]="ü",["Ӯ"]="Ü", ["э"]="e",["Э"]="E", ["ӣ"]="ī",["Ӣ"]="Ī", ["қ"]="q",["Қ"]="Q",  ["ғ"]="ġ",["Ғ"]="Ġ",
	--dated, removed in the 1998 reform
	["Ц"]="Ts", ["ц"]="ts", -- replaced with "тс", sometimes "с"
	["Щ"]="Šč", ["щ"]="šč", -- replaced with "шч"
	["Ы"]="Y", ["ы"]="y",	-- replaced with "и"
	["Ь"]="'", ["ь"]="'"	-- removed entirely
};

function export.tr(text, lang, sc)
	text = mw.ustring.gsub(
		text,
		"([АОУЕЯЁЮИӢЕЪаоуэяёюиӣе][́̀]?)([ЕеИиӢӣ])",
		function(a, e)
			local iotated = {
				['е'] = 'ye',
				['Е'] = 'Ye',
				['и'] = 'yi',
				['И'] = 'Yi',
				['ӣ'] = 'yī',
				['Ӣ'] = 'Yī',
			}
			return a .. iotated[e]
		end
	)
	
	text:gsub("^Е",'Ye'):gsub("^е",'ye')
	
	return (mw.ustring.gsub(text, '.', tt))
end

return export