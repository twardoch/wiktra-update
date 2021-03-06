-- Transliteration for Maithili in Tirhuta script

local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["๐"] = "k", ["๐"] = "kh", ["๐"] = "g", ["๐"] = "gh", ["๐"] = "แน",
    ["๐"] = "c", ["๐"] = "ch", ["๐"] = "j", ["๐"] = "jh", ["๐"] = "รฑ",
    ["๐"] = "แนญ", ["๐"] = "แนญ", ["๐"] = "แธ", ["๐"] = "แธh", ["๐"] = "แน",
    ["๐"] = "t", ["๐"] = "th", ["๐ "] = "d", ["๐ก"] = "dh", ["๐ข"] = "n",
    ["๐ฃ"] = "p", ["๐ค"] = "ph", ["๐ฅ"] = "b", ["๐ฆ"] = "bh", ["๐ง"] = "m",
    ["๐จ"] = "y", ["๐ฉ"] = "r", ["๐ช"] = "l", ["๐ซ"] = "v", ["๐ช๐"] = "แธท",
    ["๐ฌ"] = "ล", ["๐ญ"] = "แนฃ", ["๐ฎ"] = "s", ["๐ฏ"] = "h",
    ["๐๐"] = "แน", ["๐๐"] = "แนh",

    -- vowel diacritics
    ["๐ฑ"] = "i", ["๐ณ"] = "u", ["๐น"] = "ฤ", ["๐บ"] = "e", ["๐ผ"] = "ล", ["๐ฝ"] = "o", ["๐ฐ"] = "ฤ", ["๐ฒ"] = "ฤซ", ["๐ด"] = "ลซ",
    ["๐ต"] = "rฬฅ", ["๐ถ"] = "rฬฅฬ", ["๐ป"] = "ai", ["๐พ"] = "au", ["๐ท"] = "lฬฅ", ["๐ธ"] = "lฬฅฬ", ["เฅ"] = "ล", ["เคบ"] = "รข", ["เฅ"] = "ฤ",
    
    -- vowels
    ["๐"] = "a", ["๐"] = "ฤ", ["๐"] = "i", ["๐"] = "ฤซ", ["๐"] = "u", ["๐"] = "ลซ",
    ["๐"] = "rฬฅ", ["๐"] = "rฬฅฬ", ["๐"] = "lฬฅ", ["๐"] = "lฬฅฬ",
    ["๐"] = "ฤ", ["๐"] = "ai", ["๐"] = "ล", ["๐"] = "au", ["เค"] = "e", ["เค"] = "o", ["เคตเคผ"] = "u", ["เคฏเคผ"] = "i", ["เฅต"] = "ล", ["เฅด"] = "รข", ["เค"] = "ฤ",
    ["เคเคบ"] = "รฏ", ["เคเคบ"] = "รผ", ["เฅจ"] = "โ", ["เคฝ"] = "รด",

    ["๐ฟ"] = "ฬ", -- chandrabindu
    ["๐"] = "ฬ", -- anusvara
    ["๐"] = "ฬ", -- gvang
    ["๐"] = "แธฅ", -- visarga
    ["๐"] = "", -- virama
    ["๐"] = "omฬ", -- om

    -- numerals
    ["๐"] = "0", ["๐"] = "1", ["๐"] = "2", ["๐"] = "3", ["๐"] = "4", ["๐"] = "5", ["๐"] = "6", ["๐"] = "7", ["๐"] = "8", ["๐"] = "9",

    -- punctuation
    ["เฅค"] = ".", -- danda
    ["เฅฅ"] = ".", -- double danda
    ["+"] = "", -- compound separator
    -- abbreviation sign
    ["เฅฐ"] = "."
}

local nasal_assim = {
    ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐",
    ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐",
    ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐", ["๐"] = "๐",
    ["๐"] = "๐ข", ["๐"] = "๐ข", ["๐ "] = "๐ข", ["๐ก"] = "๐ข", ["๐ข"] = "๐ข",
    ["๐ฃ"] = "๐ง", ["๐ค"] = "๐ง", ["๐ฅ"] = "๐ง", ["๐ฆ"] = "๐ง", ["๐ง"] = "๐ง"
}
local perm_cl = {
    ["๐ง๐๐ช"] = true
}
local all_cons, special_cons = "๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐ ๐ก๐ข๐ฃ๐ค๐ฅ๐ฆ๐ง๐จ๐ฉ๐ช๐ซ๐ฎ๐ฌ๐ญ๐ฏ", "๐จ๐ฉ๐ช๐ฅ๐ซ๐ฏ๐ง๐ข"
local vowel, vowel_sign = "a๐ฐ๐ฑ๐ฑ๐ณ๐ด๐น๐ป๐ผ๐พเฅเฅเฅเฅเฅเฅเคบเคปเฅเฅ๐ต๐ถ๐ต๐ถ๐ธ๐ท๐ฝ๐บ", "๐๐๐๐๐๐๐๐๐๐เคเคเคเคเฅตเฅณเฅดเฅฒ๐๐๐๐"
local syncope_pattern =
    "([" ..
    vowel ..
        vowel_sign ..
            "])(๐?[" ..
                all_cons .. "])a(๐?[" .. gsub(all_cons, "๐จ", "") .. "])([๐๐ฟ]?[" .. vowel .. vowel_sign .. "])"

local function rev_string(text)
    local result, length = {}, mw.ustring.len(text)
    for i = 1, length do
        table.insert(result, mw.ustring.sub(text, length - i + 1, length - i + 1))
    end
    return table.concat(result)
end

function export.tr(text, lang, sc)
    text =
        gsub(
        text,
        "([" .. all_cons .. "]๐?)([" .. vowel .. "๐]?)",
        function(c, d)
            return c .. (d == "" and "a" or d)
        end
    )

    for word in mw.ustring.gmatch(text, "[๐ฟa]+") do
        local orig_word = word

        word = rev_string(word)

        word =
            gsub(
            word,
            "^a(๐?)([" .. all_cons .. "])(.)(.?)",
            function(opt, first, second, third)
                local a = ""
                if
                    match(first, "[" .. special_cons .. "]") and match(second, "๐") and
                        not perm_cl[first .. second .. third] or
                        match(first .. second, "๐จ[๐น๐ป๐ฒ]")
                 then
                    a = "a"
                end

                return a .. opt .. first .. second .. third
            end
        )

        while match(word, syncope_pattern) do
            word = gsub(word, syncope_pattern, "%1%2%3%4")
        end

        word =
            gsub(
            word,
            "(.?)๐(.)",
            function(succ, prev)
                local mid = nasal_assim[succ] or "n"
                if succ .. prev == "a" then
                    mid = "๐๐๐ง"
                elseif succ == "" and match(prev, "[" .. vowel .. "]") then
                    mid = "ฬ"
                end
                return succ .. mid .. prev
            end
        )

        local escaped_orig_word = gsub(orig_word, "%+", "")
        text = gsub(text, orig_word, rev_string(word))
        text = gsub(text, "๐๐๐", "gy")
    end
    text = gsub(text, "ฤ([iu])ฬ", "ฤอ %1")
    text = gsub(text, "uu", "u")
    text = gsub(text, "aรข", "รข")
    text = gsub(text, "ii", "i")
    text = gsub(text, "([iฤซaฤuลซeoรข])a", "%1")
    text = gsub(text, "[<>]", "")
    text = gsub(text, ".๐?", conv)
    return mw.ustring.toNFC(text)
end

return export