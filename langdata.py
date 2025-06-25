#!/usr/bin/env python3

import os
import re
from pathlib import Path

os.chdir(os.path.dirname(__file__))

import lupa
from lupa import LuaRuntime

res = ""
lua = LuaRuntime(unpack_returned_tuples=True)
with open(Path("wikt", "translit", "languages", "alldata.lua"), encoding="utf8") as f:
    lua_str = f.read()
    try:
        lua.execute(lua_str)
        res = lua.globals().res
    except lupa._lupa.LuaError as err:
        mods = re.findall(r"""module 'Module:(.*?)' not found""", str(err))
        print(">>> ", mods)
print(res)
