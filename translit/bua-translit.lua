local export = {}
 
local tab = {
	["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="Je", ["Ё"]="Jo", ["Ж"]="Ž", ["З"]="Z", ["И"]="I", ["Й"]="J",
	["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["Ҥ"]="Ŋ", ["О"]="O", ["Ө"]="Ö", ["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T",
	["У"]="U", ["Ү"]="Ü", ["Ф"]="F", ["Х"]="X", ["Һ"]="H", ["Ц"]="C", ["Ч"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʺ", ["Ы"]="Y",
	["Ь"]="ʹ", ["Э"]="E", ["Ю"]="Ju", ["Я"]="Ja",
	['а']='a', ['б']='b', ['в']='v', ['г']='g', ['д']='d', ['е']='je', ['ё']='jo', ['ж']='ž', ['з']='z', ['и']='i', ['й']='j',
	['к']='k', ['л']='l', ['м']='m', ['н']='n', ['ҥ']='ŋ', ['о']='o', ['ө']='ö', ['п']='p', ['р']='r', ['с']='s', ['т']='t',
	['у']='u', ['ү']='ü', ['ф']='f', ['х']='x', ['һ']='h', ['ц']='c', ['ч']='č', ['ш']='š', ['щ']='šč', ['ъ']='ʺ', ['ы']='y',
	['ь']='ʹ', ['э']='e', ['ю']='ju', ['я']='ja',
}

function export.tr(text, lang, sc)
	return (mw.ustring.gsub(text,'.',tab))
end
 
return export