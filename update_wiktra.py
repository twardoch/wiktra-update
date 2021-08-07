#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# pip install pywikiapi

import pywikiapi
from pathlib import Path
import argparse
import logging
import re

logging.basicConfig(level=logging.INFO)
base_folder = Path(Path(__file__).parent)


class WiktionaryModuleDownload(object):

    re_require = re.compile(r"""require\(['"]Module:(.*?)['"]\)""")

    def __init__(self, output_folder, force=False):
        self.outf = output_folder
        self.force = force
        if not Path(self.outf).is_dir():
            Path(self.outf).mkdir(parents=True, exist_ok=True)
        self.wk = pywikiapi.Site(
            "https://en.wiktionary.org/w/api.php", json_object_hook=pywikiapi.AttrDict
        )
        self.downloaded = []

    def check_write(self, path):
        if Path(path).exists() and not self.force:
            return False
        else:
            return True


    def get_module_code(self, page="Goth-translit"):
        try:
            res = self.wk("parse", page=f"Module:{page}", prop="wikitext")
        except pywikiapi.utils.ApiError:
            return ''
        return res.parse.wikitext

    def write_modules_category(self, cat="Transliteration_modules"):
        logging.info(f"Category: '{cat}'")
        for r in self.wk.query(list="categorymembers", cmtitle=f"Category:{cat}"):
            for page in r.categorymembers:
                page = page.title.split(":")
                if page[0] == "Module":
                    if len(page) > 1:
                        if page[1] != "User":
                            self.write_module(page[1])

    def write_module(self, page="Goth-translit", parent=None):
        text = ''
        inpath = Path(page)
        outfolder = Path(self.outf, inpath.parent)
        outpath = Path(outfolder, f"{inpath.name}.lua".replace(" ", "_"))
        if self.check_write(outpath):
            info = f"Page: '{page}'"
            if parent:
                info = f"Page: '{parent}' > " + info
            logging.info(info)
            text = self.get_module_code(page)
            if len(text):
                self.downloaded.append(page)
                for mod in self.re_require.findall(text):
                    if mod not in self.downloaded:
                        self.write_module(mod, parent=page)
                    text, count = re.subn(
                        r"""(require|loadData)(\(['"])(Module:)("""
                        + mod
                        + r""")(['"]\))""",
                        r"\1\2" + r"\4".replace(" ", "_") + r"\5",
                        text,
                    )
                if not outfolder.is_dir():
                    outfolder.mkdir(parents=True, exist_ok=True)
                with open(outpath, "w", encoding="utf-8") as f:
                    f.write(text)

def cli():

    parser = argparse.ArgumentParser(
        prog="download_wiktionary_modules",
        description="""Downloads specified Lua modules from Wiktionary""",
    )
    parser.add_argument(
        "-o",
        "--output",
        default=Path(base_folder, "wikt", "translit"),
        required=False,
        metavar="folder",
        dest="output",
        help="""Folder in which the code will be created""",
    )
    parser.add_argument(
        "-p",
        "--page",
        default=None,
        required=False,
        metavar="page",
        dest="page",
        help="""Get specific page""",
    )
    parser.add_argument(
        "-f",
        "--force",
        action="store_true",
        dest="force",
        help="""Force overwrite""",
    )

    args = parser.parse_args()
    main(output=args.output, page=args.page, force=args.force)


def main(output, page=None, force=False):
    wkd = WiktionaryModuleDownload(output, force)
    if page:
        wkd.write_module(page)
    else:
        wkd.write_modules_category("Transliteration_modules")
        for mod in [
                "languages", "languages/alldata", "languages/byTranslitModule",
                "wikimedia_languages", "wikimedia_languages/data",
                "languages/JSON", "language-like", "etymology_languages",
                "families", "families/data", "scripts", "scripts/data",
                "scripts/by_name", "scripts/code_to_canonical_name",
                "writing_systems"
        ]:
            wkd.write_module(mod)

if __name__ == "__main__":
    cli()
