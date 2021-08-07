local export = {}

local tt = {
	["𐔰"]="a", ["𐔱"]="b", ["𐔲"]="g", ["𐔳"]="d", ["𐔴"]="e", ["𐔵"]="z", ["𐔶"]="ē", ["𐔷"]="ž", ["𐔸"]="t", ["𐔹"]="ć̣", ["𐔺"]="y", ["𐔻"]="ź", ["𐔼"]="i",
	["𐔽"]="ʕ", ["𐔾"]="l", ["𐔿"]="n'", ["𐕀"]="x", ["𐕁"]="d'", ["𐕂"]="c̣", ["𐕃"]="ʒ́", ["𐕄"]="ḳ", ["𐕅"]="l'", ["𐕆"]="h", ["𐕇"]="x̣", ["𐕈"]="å", ["𐕉"]="ć",
	["𐕊"]="č̣", ["𐕋"]="c'", ["𐕌"]="m", ["𐕍"]="q̇", ["𐕎"]="n", ["𐕏"]="ʒˈ", ["𐕐"]="š", ["𐕑"]="ǯ", ["𐕒"]="o", ["𐕓"]="ṭ'", ["𐕔"]="f", ["𐕕"]="ʒ", ["𐕖"]="č",
	["𐕗"]="ṗ", ["𐕘"]="ġ", ["𐕙"]="r", ["𐕚"]="s", ["𐕛"]="v", ["𐕜"]="ṭ", ["𐕝"]="ś", ["𐕞"]="ü", ["𐕟"]="c̣'", ["𐕠"]="c",
	["𐕡"]="w", ["𐕢"]="p", ["𐕣"]="k", ["𐕯"]="»"
};

function export.tr(text)
	text = mw.ustring.gsub(text, '𐕒𐕡', 'u')
	text = mw.ustring.gsub(text, '.', tt)
	
	return text
end

return export