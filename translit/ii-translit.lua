local export = {}
local gsub = mw.ustring.gsub

local convert = {
	['ꀀ'] = 'it', ['ꀁ'] = 'ix', ['ꀂ'] = 'i', ['ꀃ'] = 'ip',
	['ꀄ'] = 'iet', ['ꀅ'] = 'iex', ['ꀆ'] = 'ie', ['ꀇ'] = 'iep',
	['ꀈ'] = 'at', ['ꀉ'] = 'ax', ['ꀊ'] = 'a', ['ꀋ'] = 'ap',
	['ꀌ'] = 'uox', ['ꀍ'] = 'uo', ['ꀎ'] = 'uop',
	['ꀏ'] = 'ot', ['ꀐ'] = 'ox', ['ꀑ'] = 'o', ['ꀒ'] = 'op',
	['ꀓ'] = 'ex', ['ꀔ'] = 'e',
	['ꀕ'] = 'w',
	
	['ꀖ'] = 'bit', ['ꀗ'] = 'bix', ['ꀘ'] = 'bi', ['ꀙ'] = 'bip',
	['ꀚ'] = 'biet', ['ꀛ'] = 'biex', ['ꀜ'] = 'bie', ['ꀝ'] = 'biep',
	['ꀞ'] = 'bat', ['ꀟ'] = 'bax', ['ꀠ'] = 'ba', ['ꀡ'] = 'bap',
	['ꀢ'] = 'buox', ['ꀣ'] = 'buo', ['ꀤ'] = 'buop',
	['ꀥ'] = 'bot', ['ꀦ'] = 'box', ['ꀧ'] = 'bo', ['ꀨ'] = 'bop',
	['ꀩ'] = 'bex', ['ꀪ'] = 'be', ['ꀫ'] = 'bep',
	['ꀬ'] = 'but', ['ꀭ'] = 'bux', ['ꀮ'] = 'bu', ['ꀯ'] = 'bup',
	['ꀰ'] = 'burx', ['ꀱ'] = 'bur',
	['ꀲ'] = 'byt', ['ꀳ'] = 'byx', ['ꀴ'] = 'by', ['ꀵ'] = 'byp',
	['ꀶ'] = 'byrx', ['ꀷ'] = 'byr',
	
	['ꀸ'] = 'pit', ['ꀹ'] = 'pix', ['ꀺ'] = 'pi', ['ꀻ'] = 'pip',
	['ꀼ'] = 'piex', ['ꀽ'] = 'pie', ['ꀾ'] = 'piep',
	['ꀿ'] = 'pat', ['ꁀ'] = 'pax', ['ꁁ'] = 'pa', ['ꁂ'] = 'pap',
	['ꁃ'] = 'puox', ['ꁄ'] = 'puo', ['ꁅ'] = 'puop',
	['ꁆ'] = 'pot', ['ꁇ'] = 'pox', ['ꁈ'] = 'po', ['ꁉ'] = 'pop',
	['ꁊ'] = 'put', ['ꁋ'] = 'pux', ['ꁌ'] = 'pu', ['ꁍ'] = 'pup',
	['ꁎ'] = 'purx', ['ꁏ'] = 'pur',
	['ꁐ'] = 'pyt', ['ꁑ'] = 'pyx', ['ꁒ'] = 'py', ['ꁓ'] = 'pyp',
	['ꁔ'] = 'pyrx', ['ꁕ'] = 'pyr',
	
	['ꁖ'] = 'bbit', ['ꁗ'] = 'bbix', ['ꁘ'] = 'bbi', ['ꁙ'] = 'bbip',
	['ꁚ'] = 'bbiet', ['ꁛ'] = 'bbiex', ['ꁜ'] = 'bbie', ['ꁝ'] = 'bbiep',
	['ꁞ'] = 'bbat', ['ꁟ'] = 'bbax', ['ꁠ'] = 'bba', ['ꁡ'] = 'bbap',
	['ꁢ'] = 'bbuox', ['ꁣ'] = 'bbuo', ['ꁤ'] = 'bbuop',
	['ꁥ'] = 'bbot', ['ꁦ'] = 'bbox', ['ꁧ'] = 'bbo', ['ꁨ'] = 'bbop',
	['ꁩ'] = 'bbex', ['ꁪ'] = 'bbe', ['ꁫ'] = 'bbep',
	['ꁬ'] = 'bbut', ['ꁭ'] = 'bbux', ['ꁮ'] = 'bbu', ['ꁯ'] = 'bbup',
	['ꁰ'] = 'bburx', ['ꁱ'] = 'bbur',
	['ꁲ'] = 'bbyt', ['ꁳ'] = 'bbyx', ['ꁴ'] = 'bby', ['ꁵ'] = 'bbyp',
	
	['ꁶ'] = 'nbit', ['ꁷ'] = 'nbix', ['ꁸ'] = 'nbi', ['ꁹ'] = 'nbip',
	['ꁺ'] = 'nbiex', ['ꁻ'] = 'nbie', ['ꁼ'] = 'nbiep',
	['ꁽ'] = 'nbat', ['ꁾ'] = 'nbax', ['ꁿ'] = 'nba', ['ꂀ'] = 'nbap',
	['ꂁ'] = 'nbot', ['ꂂ'] = 'nbox', ['ꂃ'] = 'nbo', ['ꂄ'] = 'nbop',
	['ꂅ'] = 'nbut', ['ꂆ'] = 'nbux', ['ꂇ'] = 'nbu', ['ꂈ'] = 'nbup',
	['ꂉ'] = 'nburx', ['ꂊ'] = 'nbur',
	['ꂋ'] = 'nbyt', ['ꂌ'] = 'nbyx', ['ꂍ'] = 'nby', ['ꂎ'] = 'nbyp',
	['ꂏ'] = 'nbyrx', ['ꂐ'] = 'nbyr',
	
	['ꂑ'] = 'hmit', ['ꂒ'] = 'hmix', ['ꂓ'] = 'hmi', ['ꂔ'] = 'hmip',
	['ꂕ'] = 'hmiex', ['ꂖ'] = 'hmie', ['ꂗ'] = 'hmiep',
	['ꂘ'] = 'hmat', ['ꂙ'] = 'hmax', ['ꂚ'] = 'hma', ['ꂛ'] = 'hmap',
	['ꂜ'] = 'hmuox', ['ꂝ'] = 'hmuo', ['ꂞ'] = 'hmuop',
	['ꂟ'] = 'hmot', ['ꂠ'] = 'hmox', ['ꂡ'] = 'hmo', ['ꂢ'] = 'hmop',
	['ꂣ'] = 'hmut', ['ꂤ'] = 'hmux', ['ꂥ'] = 'hmu', ['ꂦ'] = 'hmup',
	['ꂧ'] = 'hmurx', ['ꂨ'] = 'hmur',
	['ꂩ'] = 'hmyx', ['ꂪ'] = 'hmy', ['ꂫ'] = 'hmyp',
	['ꂬ'] = 'hmyrx', ['ꂭ'] = 'hmyr',
	
	['ꂮ'] = 'mit', ['ꂯ'] = 'mix', ['ꂰ'] = 'mi', ['ꂱ'] = 'mip',
	['ꂲ'] = 'miex', ['ꂳ'] = 'mie', ['ꂴ'] = 'miep',
	['ꂵ'] = 'mat', ['ꂶ'] = 'max', ['ꂷ'] = 'ma', ['ꂸ'] = 'map',
	['ꂹ'] = 'muot', ['ꂺ'] = 'muox', ['ꂻ'] = 'muo', ['ꂼ'] = 'muop',
	['ꂽ'] = 'mot', ['ꂾ'] = 'mox', ['ꂿ'] = 'mo', ['ꃀ'] = 'mop',
	['ꃁ'] = 'mex', ['ꃂ'] = 'me',
	['ꃃ'] = 'mut', ['ꃄ'] = 'mux', ['ꃅ'] = 'mu', ['ꃆ'] = 'mup',
	['ꃇ'] = 'murx', ['ꃈ'] = 'mur',
	['ꃉ'] = 'myt', ['ꃊ'] = 'myx', ['ꃋ'] = 'my', ['ꃌ'] = 'myp',
	
	['ꃍ'] = 'fit', ['ꃎ'] = 'fix', ['ꃏ'] = 'fi', ['ꃐ'] = 'fip',
	['ꃑ'] = 'fat', ['ꃒ'] = 'fax', ['ꃓ'] = 'fa', ['ꃔ'] = 'fap',
	['ꃕ'] = 'fox', ['ꃖ'] = 'fo', ['ꃗ'] = 'fop',
	['ꃘ'] = 'fut', ['ꃙ'] = 'fux', ['ꃚ'] = 'fu', ['ꃛ'] = 'fup',
	['ꃜ'] = 'furx', ['ꃝ'] = 'fur',
	['ꃞ'] = 'fyt', ['ꃟ'] = 'fyx', ['ꃠ'] = 'fy', ['ꃡ'] = 'fyp',
	
	['ꃢ'] = 'vit', ['ꃣ'] = 'vix', ['ꃤ'] = 'vi', ['ꃥ'] = 'vip',
	['ꃦ'] = 'viet', ['ꃧ'] = 'viex', ['ꃨ'] = 'vie', ['ꃩ'] = 'viep',
	['ꃪ'] = 'vat', ['ꃫ'] = 'vax', ['ꃬ'] = 'va', ['ꃭ'] = 'vap',
	['ꃮ'] = 'vot', ['ꃯ'] = 'vox', ['ꃰ'] = 'vo', ['ꃱ'] = 'vop',
	['ꃲ'] = 'vex', ['ꃳ'] = 'vep',
	['ꃴ'] = 'vut', ['ꃵ'] = 'vux', ['ꃶ'] = 'vu', ['ꃷ'] = 'vup',
	['ꃸ'] = 'vurx', ['ꃹ'] = 'vur',
	['ꃺ'] = 'vyt', ['ꃻ'] = 'vyx', ['ꃼ'] = 'vy', ['ꃽ'] = 'vyp',
	['ꃾ'] = 'vyrx', ['ꃿ'] = 'vyr',
	
	['ꄀ'] = 'dit', ['ꄁ'] = 'dix', ['ꄂ'] = 'di', ['ꄃ'] = 'dip',
	['ꄄ'] = 'diex', ['ꄅ'] = 'die', ['ꄆ'] = 'diep',
	['ꄇ'] = 'dat', ['ꄈ'] = 'dax', ['ꄉ'] = 'da', ['ꄊ'] = 'dap',
	['ꄋ'] = 'duox', ['ꄌ'] = 'duo',
	['ꄍ'] = 'dot', ['ꄎ'] = 'dox', ['ꄏ'] = 'do', ['ꄐ'] = 'dop',
	['ꄑ'] = 'dex', ['ꄒ'] = 'de', ['ꄓ'] = 'dep',
	['ꄔ'] = 'dut', ['ꄕ'] = 'dux', ['ꄖ'] = 'du', ['ꄗ'] = 'dup',
	['ꄘ'] = 'durx', ['ꄙ'] = 'dur',
	
	['ꄚ'] = 'tit', ['ꄛ'] = 'tix', ['ꄜ'] = 'ti', ['ꄝ'] = 'tip',
	['ꄞ'] = 'tiex', ['ꄟ'] = 'tie', ['ꄠ'] = 'tiep',
	['ꄡ'] = 'tat', ['ꄢ'] = 'tax', ['ꄣ'] = 'ta', ['ꄤ'] = 'tap',
	['ꄥ'] = 'tuot', ['ꄦ'] = 'tuox', ['ꄧ'] = 'tuo', ['ꄨ'] = 'tuop',
	['ꄩ'] = 'tot', ['ꄪ'] = 'tox', ['ꄫ'] = 'to', ['ꄬ'] = 'top',
	['ꄭ'] = 'tex', ['ꄮ'] = 'te', ['ꄯ'] = 'tep',
	['ꄰ'] = 'tut', ['ꄱ'] = 'tux', ['ꄲ'] = 'tu', ['ꄳ'] = 'tup',
	['ꄴ'] = 'turx', ['ꄵ'] = 'tur',
	
	['ꄶ'] = 'ddit', ['ꄷ'] = 'ddix', ['ꄸ'] = 'ddi', ['ꄹ'] = 'ddip',
	['ꄺ'] = 'ddiex', ['ꄻ'] = 'ddie', ['ꄼ'] = 'ddiep',
	['ꄽ'] = 'ddat', ['ꄾ'] = 'ddax', ['ꄿ'] = 'dda', ['ꅀ'] = 'ddap',
	['ꅁ'] = 'dduox', ['ꅂ'] = 'dduo', ['ꅃ'] = 'dduop',
	['ꅄ'] = 'ddot', ['ꅅ'] = 'ddox', ['ꅆ'] = 'ddo', ['ꅇ'] = 'ddop',
	['ꅈ'] = 'ddex', ['ꅉ'] = 'dde', ['ꅊ'] = 'ddep',
	['ꅋ'] = 'ddut', ['ꅌ'] = 'ddux', ['ꅍ'] = 'ddu', ['ꅎ'] = 'ddup',
	['ꅏ'] = 'ddurx', ['ꅐ'] = 'ddur',
	
	['ꅑ'] = 'ndit', ['ꅒ'] = 'ndix', ['ꅓ'] = 'ndi', ['ꅔ'] = 'ndip',
	['ꅕ'] = 'ndiex', ['ꅖ'] = 'ndie',
	['ꅗ'] = 'ndat', ['ꅘ'] = 'ndax', ['ꅙ'] = 'nda', ['ꅚ'] = 'ndap',
	['ꅛ'] = 'ndot', ['ꅜ'] = 'ndox', ['ꅝ'] = 'ndo', ['ꅞ'] = 'ndop',
	['ꅟ'] = 'ndex', ['ꅠ'] = 'nde', ['ꅡ'] = 'ndep',
	['ꅢ'] = 'ndut', ['ꅣ'] = 'ndux', ['ꅤ'] = 'ndu', ['ꅥ'] = 'ndup',
	['ꅦ'] = 'ndurx', ['ꅧ'] = 'ndur',
	
	['ꅨ'] = 'hnit', ['ꅩ'] = 'hnix', ['ꅪ'] = 'hni', ['ꅫ'] = 'hnip',
	['ꅬ'] = 'hniet', ['ꅭ'] = 'hniex', ['ꅮ'] = 'hnie', ['ꅯ'] = 'hniep',
	['ꅰ'] = 'hnat', ['ꅱ'] = 'hnax', ['ꅲ'] = 'hna', ['ꅳ'] = 'hnap',
	['ꅴ'] = 'hnuox', ['ꅵ'] = 'hnuo',
	['ꅶ'] = 'hnot', ['ꅷ'] = 'hnox', ['ꅸ'] = 'hnop',
	['ꅹ'] = 'hnex', ['ꅺ'] = 'hne', ['ꅻ'] = 'hnep',
	['ꅼ'] = 'hnut',
	
	['ꅽ'] = 'nit', ['ꅾ'] = 'nix', ['ꅿ'] = 'ni', ['ꆀ'] = 'nip',
	['ꆁ'] = 'niex', ['ꆂ'] = 'nie', ['ꆃ'] = 'niep',
	['ꆄ'] = 'nax', ['ꆅ'] = 'na', ['ꆆ'] = 'nap',
	['ꆇ'] = 'nuox', ['ꆈ'] = 'nuo', ['ꆉ'] = 'nuop',
	['ꆊ'] = 'not', ['ꆋ'] = 'nox', ['ꆌ'] = 'no', ['ꆍ'] = 'nop',
	['ꆎ'] = 'nex', ['ꆏ'] = 'ne', ['ꆐ'] = 'nep',
	['ꆑ'] = 'nut', ['ꆒ'] = 'nux', ['ꆓ'] = 'nu', ['ꆔ'] = 'nup',
	['ꆕ'] = 'nurx', ['ꆖ'] = 'nur',
	
	['ꆗ'] = 'hlit', ['ꆘ'] = 'hlix', ['ꆙ'] = 'hli', ['ꆚ'] = 'hlip',
	['ꆛ'] = 'hliex', ['ꆜ'] = 'hlie', ['ꆝ'] = 'hliep',
	['ꆞ'] = 'hlat', ['ꆟ'] = 'hlax', ['ꆠ'] = 'hla', ['ꆡ'] = 'hlap',
	['ꆢ'] = 'hluox', ['ꆣ'] = 'hluo', ['ꆤ'] = 'hluop',
	['ꆥ'] = 'hlox', ['ꆦ'] = 'hlo', ['ꆧ'] = 'hlop',
	['ꆨ'] = 'hlex', ['ꆩ'] = 'hle', ['ꆪ'] = 'hlep',
	['ꆫ'] = 'hlut', ['ꆬ'] = 'hlux', ['ꆭ'] = 'hlu', ['ꆮ'] = 'hlup',
	['ꆯ'] = 'hlurx', ['ꆰ'] = 'hlur',
	['ꆱ'] = 'hlyt', ['ꆲ'] = 'hlyx', ['ꆳ'] = 'hly', ['ꆴ'] = 'hlyp',
	['ꆵ'] = 'hlyrx', ['ꆶ'] = 'hlyr',
	
	['ꆷ'] = 'lit', ['ꆸ'] = 'lix', ['ꆹ'] = 'li', ['ꆺ'] = 'lip',
	['ꆻ'] = 'liet', ['ꆼ'] = 'liex', ['ꆽ'] = 'lie', ['ꆾ'] = 'liep',
	['ꆿ'] = 'lat', ['ꇀ'] = 'lax', ['ꇁ'] = 'la', ['ꇂ'] = 'lap',
	['ꇃ'] = 'luot', ['ꇄ'] = 'luox', ['ꇅ'] = 'luo', ['ꇆ'] = 'luop',
	['ꇇ'] = 'lot', ['ꇈ'] = 'lox', ['ꇉ'] = 'lo', ['ꇊ'] = 'lop',
	['ꇋ'] = 'lex', ['ꇌ'] = 'le', ['ꇍ'] = 'lep',
	['ꇎ'] = 'lut', ['ꇏ'] = 'lux', ['ꇐ'] = 'lu', ['ꇑ'] = 'lup',
	['ꇒ'] = 'lurx', ['ꇓ'] = 'lur',
	['ꇔ'] = 'lyt', ['ꇕ'] = 'lyx', ['ꇖ'] = 'ly', ['ꇗ'] = 'lyp',
	['ꇘ'] = 'lyrx', ['ꇙ'] = 'lyr',
	
	['ꇚ'] = 'git', ['ꇛ'] = 'gix', ['ꇜ'] = 'gi', ['ꇝ'] = 'gip',
	['ꇞ'] = 'giet', ['ꇟ'] = 'giex', ['ꇠ'] = 'gie', ['ꇡ'] = 'giep',
	['ꇢ'] = 'gat', ['ꇣ'] = 'gax', ['ꇤ'] = 'ga', ['ꇥ'] = 'gap',
	['ꇦ'] = 'guot', ['ꇧ'] = 'guox', ['ꇨ'] = 'guo', ['ꇩ'] = 'guop',
	['ꇪ'] = 'got', ['ꇫ'] = 'gox', ['ꇬ'] = 'go', ['ꇭ'] = 'gop',
	['ꇮ'] = 'get', ['ꇯ'] = 'gex', ['ꇰ'] = 'ge', ['ꇱ'] = 'gep',
	['ꇲ'] = 'gut', ['ꇳ'] = 'gux', ['ꇴ'] = 'gu', ['ꇵ'] = 'gup',
	['ꇶ'] = 'gurx', ['ꇷ'] = 'gur',
	
	['ꇸ'] = 'kit', ['ꇹ'] = 'kix', ['ꇺ'] = 'ki', ['ꇻ'] = 'kip',
	['ꇼ'] = 'kiex', ['ꇽ'] = 'kie', ['ꇾ'] = 'kiep',
	['ꇿ'] = 'kat', ['ꈀ'] = 'kax', ['ꈁ'] = 'ka', ['ꈂ'] = 'kap',
	['ꈃ'] = 'kuox', ['ꈄ'] = 'kuo', ['ꈅ'] = 'kuop',
	['ꈆ'] = 'kot', ['ꈇ'] = 'kox', ['ꈈ'] = 'ko', ['ꈉ'] = 'kop',
	['ꈊ'] = 'ket', ['ꈋ'] = 'kex', ['ꈌ'] = 'ke', ['ꈍ'] = 'kep',
	['ꈎ'] = 'kut', ['ꈏ'] = 'kux', ['ꈐ'] = 'ku', ['ꈑ'] = 'kup',
	['ꈒ'] = 'kurx', ['ꈓ'] = 'kur',
	
	['ꈔ'] = 'ggit', ['ꈕ'] = 'ggix', ['ꈖ'] = 'ggi',
	['ꈗ'] = 'ggiex', ['ꈘ'] = 'ggie', ['ꈙ'] = 'ggiep',
	['ꈚ'] = 'ggat', ['ꈛ'] = 'ggax', ['ꈜ'] = 'gga', ['ꈝ'] = 'ggap',
	['ꈞ'] = 'gguot', ['ꈟ'] = 'gguox', ['ꈠ'] = 'gguo', ['ꈡ'] = 'gguop',
	['ꈢ'] = 'ggot', ['ꈣ'] = 'ggox', ['ꈤ'] = 'ggo', ['ꈥ'] = 'ggop',
	['ꈦ'] = 'gget', ['ꈧ'] = 'ggex', ['ꈨ'] = 'gge', ['ꈩ'] = 'ggep',
	['ꈪ'] = 'ggut', ['ꈫ'] = 'ggux', ['ꈬ'] = 'ggu', ['ꈭ'] = 'ggup',
	['ꈮ'] = 'ggurx', ['ꈯ'] = 'ggur',
	
	['ꈰ'] = 'mgiex', ['ꈱ'] = 'mgie',
	['ꈲ'] = 'mgat', ['ꈳ'] = 'mgax', ['ꈴ'] = 'mga', ['ꈵ'] = 'mgap',
	['ꈶ'] = 'mguox', ['ꈷ'] = 'mguo', ['ꈸ'] = 'mguop',
	['ꈹ'] = 'mgot', ['ꈺ'] = 'mgox', ['ꈻ'] = 'mgo', ['ꈼ'] = 'mgop',
	['ꈽ'] = 'mgex', ['ꈾ'] = 'mge', ['ꈿ'] = 'mgep',
	['ꉀ'] = 'mgut', ['ꉁ'] = 'mgux', ['ꉂ'] = 'mgu', ['ꉃ'] = 'mgup',
	['ꉄ'] = 'mgurx', ['ꉅ'] = 'mgur',
	
	['ꉆ'] = 'hxit', ['ꉇ'] = 'hxix', ['ꉈ'] = 'hxi', ['ꉉ'] = 'hxip',
	['ꉊ'] = 'hxiet', ['ꉋ'] = 'hxiex', ['ꉌ'] = 'hxie', ['ꉍ'] = 'hxiep',
	['ꉎ'] = 'hxat', ['ꉏ'] = 'hxax', ['ꉐ'] = 'hxa', ['ꉑ'] = 'hxap',
	['ꉒ'] = 'hxuot', ['ꉓ'] = 'hxuox', ['ꉔ'] = 'hxuo', ['ꉕ'] = 'hxuop',
	['ꉖ'] = 'hxot', ['ꉗ'] = 'hxox', ['ꉘ'] = 'hxo', ['ꉙ'] = 'hxop',
	['ꉚ'] = 'hxex', ['ꉛ'] = 'hxe', ['ꉜ'] = 'hxep',
	
	['ꉝ'] = 'ngiex', ['ꉞ'] = 'ngie', ['ꉟ'] = 'ngiep',
	['ꉠ'] = 'ngat', ['ꉡ'] = 'ngax', ['ꉢ'] = 'nga', ['ꉣ'] = 'ngap',
	['ꉤ'] = 'nguot', ['ꉥ'] = 'nguox', ['ꉦ'] = 'nguo',
	['ꉧ'] = 'ngot', ['ꉨ'] = 'ngox', ['ꉩ'] = 'ngo', ['ꉪ'] = 'ngop',
	['ꉫ'] = 'ngex', ['ꉬ'] = 'nge', ['ꉭ'] = 'ngep',
	
	['ꉮ'] = 'hit',
	['ꉯ'] = 'hiex', ['ꉰ'] = 'hie',
	['ꉱ'] = 'hat', ['ꉲ'] = 'hax', ['ꉳ'] = 'ha', ['ꉴ'] = 'hap',
	['ꉵ'] = 'huot', ['ꉶ'] = 'huox', ['ꉷ'] = 'huo', ['ꉸ'] = 'huop',
	['ꉹ'] = 'hot', ['ꉺ'] = 'hox', ['ꉻ'] = 'ho', ['ꉼ'] = 'hop',
	['ꉽ'] = 'hex', ['ꉾ'] = 'he', ['ꉿ'] = 'hep',
	
	['ꊀ'] = 'wat', ['ꊁ'] = 'wax', ['ꊂ'] = 'wa', ['ꊃ'] = 'wap',
	['ꊄ'] = 'wuox', ['ꊅ'] = 'wuo', ['ꊆ'] = 'wuop',
	['ꊇ'] = 'wox', ['ꊈ'] = 'wo', ['ꊉ'] = 'wop',
	['ꊊ'] = 'wex', ['ꊋ'] = 'we', ['ꊌ'] = 'wep',
	
	['ꊍ'] = 'zit', ['ꊎ'] = 'zix', ['ꊏ'] = 'zi', ['ꊐ'] = 'zip',
	['ꊑ'] = 'ziex', ['ꊒ'] = 'zie', ['ꊓ'] = 'ziep',
	['ꊔ'] = 'zat', ['ꊕ'] = 'zax', ['ꊖ'] = 'za', ['ꊗ'] = 'zap',
	['ꊘ'] = 'zuox', ['ꊙ'] = 'zuo', ['ꊚ'] = 'zuop',
	['ꊛ'] = 'zot', ['ꊜ'] = 'zox', ['ꊝ'] = 'zo', ['ꊞ'] = 'zop',
	['ꊟ'] = 'zex', ['ꊠ'] = 'ze', ['ꊡ'] = 'zep',
	['ꊢ'] = 'zut', ['ꊣ'] = 'zux', ['ꊤ'] = 'zu', ['ꊥ'] = 'zup',
	['ꊦ'] = 'zurx', ['ꊧ'] = 'zur',
	['ꊨ'] = 'zyt', ['ꊩ'] = 'zyx', ['ꊪ'] = 'zy', ['ꊫ'] = 'zyp',
	['ꊬ'] = 'zyrx', ['ꊭ'] = 'zyr',
	
	['ꊮ'] = 'cit', ['ꊯ'] = 'cix', ['ꊰ'] = 'ci', ['ꊱ'] = 'cip',
	['ꊲ'] = 'ciet', ['ꊳ'] = 'ciex', ['ꊴ'] = 'cie', ['ꊵ'] = 'ciep',
	['ꊶ'] = 'cat', ['ꊷ'] = 'cax', ['ꊸ'] = 'ca', ['ꊹ'] = 'cap',
	['ꊺ'] = 'cuox', ['ꊻ'] = 'cuo', ['ꊼ'] = 'cuop',
	['ꊽ'] = 'cot', ['ꊾ'] = 'cox', ['ꊿ'] = 'co', ['ꋀ'] = 'cop',
	['ꋁ'] = 'cex', ['ꋂ'] = 'ce', ['ꋃ'] = 'cep',
	['ꋄ'] = 'cut', ['ꋅ'] = 'cux', ['ꋆ'] = 'cu', ['ꋇ'] = 'cup',
	['ꋈ'] = 'curx', ['ꋉ'] = 'cur',
	['ꋊ'] = 'cyt', ['ꋋ'] = 'cyx', ['ꋌ'] = 'cy', ['ꋍ'] = 'cyp',
	['ꋎ'] = 'cyrx', ['ꋏ'] = 'cyr',
	
	['ꋐ'] = 'zzit', ['ꋑ'] = 'zzix', ['ꋒ'] = 'zzi', ['ꋓ'] = 'zzip',
	['ꋔ'] = 'zziet', ['ꋕ'] = 'zziex', ['ꋖ'] = 'zzie', ['ꋗ'] = 'zziep',
	['ꋘ'] = 'zzat', ['ꋙ'] = 'zzax', ['ꋚ'] = 'zza', ['ꋛ'] = 'zzap',
	['ꋜ'] = 'zzox', ['ꋝ'] = 'zzo', ['ꋞ'] = 'zzop',
	['ꋟ'] = 'zzex', ['ꋠ'] = 'zze', ['ꋡ'] = 'zzep',
	['ꋢ'] = 'zzux', ['ꋣ'] = 'zzu', ['ꋤ'] = 'zzup',
	['ꋥ'] = 'zzurx', ['ꋦ'] = 'zzur',
	['ꋧ'] = 'zzyt', ['ꋨ'] = 'zzyx', ['ꋩ'] = 'zzy', ['ꋪ'] = 'zzyp',
	['ꋫ'] = 'zzyrx', ['ꋬ'] = 'zzyr',
	
	['ꋭ'] = 'nzit', ['ꋮ'] = 'nzix', ['ꋯ'] = 'nzi', ['ꋰ'] = 'nzip',
	['ꋱ'] = 'nziex', ['ꋲ'] = 'nzie', ['ꋳ'] = 'nziep',
	['ꋴ'] = 'nzat', ['ꋵ'] = 'nzax', ['ꋶ'] = 'nza', ['ꋷ'] = 'nzap',
	['ꋸ'] = 'nzuox', ['ꋹ'] = 'nzuo',
	['ꋺ'] = 'nzox', ['ꋻ'] = 'nzop',
	['ꋼ'] = 'nzex', ['ꋽ'] = 'nze',
	['ꋾ'] = 'nzux', ['ꋿ'] = 'nzu', ['ꌀ'] = 'nzup',
	['ꌁ'] = 'nzurx', ['ꌂ'] = 'nzur',
	['ꌃ'] = 'nzyt', ['ꌄ'] = 'nzyx', ['ꌅ'] = 'nzy', ['ꌆ'] = 'nzyp',
	['ꌇ'] = 'nzyrx', ['ꌈ'] = 'nzyr',
	
	['ꌉ'] = 'sit', ['ꌊ'] = 'six', ['ꌋ'] = 'si', ['ꌌ'] = 'sip',
	['ꌍ'] = 'siex', ['ꌎ'] = 'sie', ['ꌏ'] = 'siep',
	['ꌐ'] = 'sat', ['ꌑ'] = 'sax', ['ꌒ'] = 'sa', ['ꌓ'] = 'sap',
	['ꌔ'] = 'suox', ['ꌕ'] = 'suo', ['ꌖ'] = 'suop',
	['ꌗ'] = 'sot', ['ꌘ'] = 'sox', ['ꌙ'] = 'so', ['ꌚ'] = 'sop',
	['ꌛ'] = 'sex', ['ꌜ'] = 'se', ['ꌝ'] = 'sep',
	['ꌞ'] = 'sut', ['ꌟ'] = 'sux', ['ꌠ'] = 'su', ['ꌡ'] = 'sup',
	['ꌢ'] = 'surx', ['ꌣ'] = 'sur',
	['ꌤ'] = 'syt', ['ꌥ'] = 'syx', ['ꌦ'] = 'sy', ['ꌧ'] = 'syp',
	['ꌨ'] = 'syrx', ['ꌩ'] = 'syr',
	
	['ꌪ'] = 'ssit', ['ꌫ'] = 'ssix', ['ꌬ'] = 'ssi', ['ꌭ'] = 'ssip',
	['ꌮ'] = 'ssiex', ['ꌯ'] = 'ssie', ['ꌰ'] = 'ssiep',
	['ꌱ'] = 'ssat', ['ꌲ'] = 'ssax', ['ꌳ'] = 'ssa', ['ꌴ'] = 'ssap',
	['ꌵ'] = 'ssot', ['ꌶ'] = 'ssox', ['ꌷ'] = 'sso', ['ꌸ'] = 'ssop',
	['ꌹ'] = 'ssex', ['ꌺ'] = 'sse', ['ꌻ'] = 'ssep',
	['ꌼ'] = 'ssut', ['ꌽ'] = 'ssux', ['ꌾ'] = 'ssu', ['ꌿ'] = 'ssup',
	['ꍀ'] = 'ssyt', ['ꍁ'] = 'ssyx', ['ꍂ'] = 'ssy', ['ꍃ'] = 'ssyp',
	['ꍄ'] = 'ssyrx', ['ꍅ'] = 'ssyr',
	
	['ꍆ'] = 'zhat', ['ꍇ'] = 'zhax', ['ꍈ'] = 'zha', ['ꍉ'] = 'zhap',
	['ꍊ'] = 'zhuox', ['ꍋ'] = 'zhuo', ['ꍌ'] = 'zhuop',
	['ꍍ'] = 'zhot', ['ꍎ'] = 'zhox', ['ꍏ'] = 'zho', ['ꍐ'] = 'zhop',
	['ꍑ'] = 'zhet', ['ꍒ'] = 'zhex', ['ꍓ'] = 'zhe', ['ꍔ'] = 'zhep',
	['ꍕ'] = 'zhut', ['ꍖ'] = 'zhux', ['ꍗ'] = 'zhu', ['ꍘ'] = 'zhup',
	['ꍙ'] = 'zhurx', ['ꍚ'] = 'zhur',
	['ꍛ'] = 'zhyt', ['ꍜ'] = 'zhyx', ['ꍝ'] = 'zhy', ['ꍞ'] = 'zhyp',
	['ꍟ'] = 'zhyrx', ['ꍠ'] = 'zhyr',
	
	['ꍡ'] = 'chat', ['ꍢ'] = 'chax', ['ꍣ'] = 'cha', ['ꍤ'] = 'chap',
	['ꍥ'] = 'chuot', ['ꍦ'] = 'chuox', ['ꍧ'] = 'chuo', ['ꍨ'] = 'chuop',
	['ꍩ'] = 'chot', ['ꍪ'] = 'chox', ['ꍫ'] = 'cho', ['ꍬ'] = 'chop',
	['ꍭ'] = 'chet', ['ꍮ'] = 'chex', ['ꍯ'] = 'che', ['ꍰ'] = 'chep',
	['ꍱ'] = 'chux', ['ꍲ'] = 'chu', ['ꍳ'] = 'chup',
	['ꍴ'] = 'churx', ['ꍵ'] = 'chur',
	['ꍶ'] = 'chyt', ['ꍷ'] = 'chyx', ['ꍸ'] = 'chy', ['ꍹ'] = 'chyp',
	['ꍺ'] = 'chyrx', ['ꍻ'] = 'chyr',
	
	['ꍼ'] = 'rrax', ['ꍽ'] = 'rra',
	['ꍾ'] = 'rruox', ['ꍿ'] = 'rruo',
	['ꎀ'] = 'rrot', ['ꎁ'] = 'rrox', ['ꎂ'] = 'rro', ['ꎃ'] = 'rrop',
	['ꎄ'] = 'rret', ['ꎅ'] = 'rrex', ['ꎆ'] = 'rre', ['ꎇ'] = 'rrep',
	['ꎈ'] = 'rrut', ['ꎉ'] = 'rrux', ['ꎊ'] = 'rru', ['ꎋ'] = 'rrup',
	['ꎌ'] = 'rrurx', ['ꎍ'] = 'rrur',
	['ꎎ'] = 'rryt', ['ꎏ'] = 'rryx', ['ꎐ'] = 'rry', ['ꎑ'] = 'rryp',
	['ꎒ'] = 'rryrx', ['ꎓ'] = 'rryr',
	
	['ꎔ'] = 'nrat', ['ꎕ'] = 'nrax', ['ꎖ'] = 'nra', ['ꎗ'] = 'nrap',
	['ꎘ'] = 'nrox', ['ꎙ'] = 'nro', ['ꎚ'] = 'nrop',
	['ꎛ'] = 'nret', ['ꎜ'] = 'nrex', ['ꎝ'] = 'nre', ['ꎞ'] = 'nrep',
	['ꎟ'] = 'nrut', ['ꎠ'] = 'nrux', ['ꎡ'] = 'nru', ['ꎢ'] = 'nrup',
	['ꎣ'] = 'nrurx', ['ꎤ'] = 'nrur',
	['ꎥ'] = 'nryt', ['ꎦ'] = 'nryx', ['ꎧ'] = 'nry', ['ꎨ'] = 'nryp', 
	['ꎩ'] = 'nryrx', ['ꎪ'] = 'nryr',
	
	['ꎫ'] = 'shat', ['ꎬ'] = 'shax', ['ꎭ'] = 'sha', ['ꎮ'] = 'shap',
	['ꎯ'] = 'shuox', ['ꎰ'] = 'shuo', ['ꎱ'] = 'shuop',
	['ꎲ'] = 'shot', ['ꎳ'] = 'shox', ['ꎴ'] = 'sho', ['ꎵ'] = 'shop',
	['ꎶ'] = 'shet', ['ꎷ'] = 'shex', ['ꎸ'] = 'she', ['ꎹ'] = 'shep',
	['ꎺ'] = 'shut', ['ꎻ'] = 'shux', ['ꎼ'] = 'shu', ['ꎽ'] = 'shup',
	['ꎾ'] = 'shurx', ['ꎿ'] = 'shur',
	['ꏀ'] = 'shyt', ['ꏁ'] = 'shyx', ['ꏂ'] = 'shy', ['ꏃ'] = 'shyp',
	['ꏄ'] = 'shyrx', ['ꏅ'] = 'shyr',
	
	['ꏆ'] = 'rat', ['ꏇ'] = 'rax', ['ꏈ'] = 'ra', ['ꏉ'] = 'rap',
	['ꏊ'] = 'ruox', ['ꏋ'] = 'ruo', ['ꏌ'] = 'ruop',
	['ꏍ'] = 'rot', ['ꏎ'] = 'rox', ['ꏏ'] = 'ro', ['ꏐ'] = 'rop',
	['ꏑ'] = 'rex', ['ꏒ'] = 're', ['ꏓ'] = 'rep',
	['ꏔ'] = 'rut', ['ꏕ'] = 'rux', ['ꏖ'] = 'ru', ['ꏗ'] = 'rup',
	['ꏘ'] = 'rurx', ['ꏙ'] = 'rur',
	['ꏚ'] = 'ryt', ['ꏛ'] = 'ryx', ['ꏜ'] = 'ry', ['ꏝ'] = 'ryp',
	['ꏞ'] = 'ryrx', ['ꏟ'] = 'ryr',
	
	['ꏠ'] = 'jit', ['ꏡ'] = 'jix', ['ꏢ'] = 'ji', ['ꏣ'] = 'jip',
	['ꏤ'] = 'jiet', ['ꏥ'] = 'jiex', ['ꏦ'] = 'jie', ['ꏧ'] = 'jiep',
	['ꏨ'] = 'juot', ['ꏩ'] = 'juox', ['ꏪ'] = 'juo', ['ꏫ'] = 'juop',
	['ꏬ'] = 'jot', ['ꏭ'] = 'jox', ['ꏮ'] = 'jo', ['ꏯ'] = 'jop',
	['ꏰ'] = 'jut', ['ꏱ'] = 'jux', ['ꏲ'] = 'ju', ['ꏳ'] = 'jup',
	['ꏴ'] = 'jurx', ['ꏵ'] = 'jur',
	['ꏶ'] = 'jyt', ['ꏷ'] = 'jyx', ['ꏸ'] = 'jy', ['ꏹ'] = 'jyp',
	['ꏺ'] = 'jyrx', ['ꏻ'] = 'jyr',
	
	['ꏼ'] = 'qit', ['ꏽ'] = 'qix', ['ꏾ'] = 'qi', ['ꏿ'] = 'qip',
	['ꐀ'] = 'qiet', ['ꐁ'] = 'qiex', ['ꐂ'] = 'qie', ['ꐃ'] = 'qiep',
	['ꐄ'] = 'quot', ['ꐅ'] = 'quox', ['ꐆ'] = 'quo', ['ꐇ'] = 'quop',
	['ꐈ'] = 'qot', ['ꐉ'] = 'qox', ['ꐊ'] = 'qo', ['ꐋ'] = 'qop',
	['ꐌ'] = 'qut', ['ꐍ'] = 'qux', ['ꐎ'] = 'qu', ['ꐏ'] = 'qup',
	['ꐐ'] = 'qurx', ['ꐑ'] = 'qur',
	['ꐒ'] = 'qyt', ['ꐓ'] = 'qyx', ['ꐔ'] = 'qy', ['ꐕ'] = 'qyp',
	['ꐖ'] = 'qyrx', ['ꐗ'] = 'qyr',
	
	['ꐘ'] = 'jjit', ['ꐙ'] = 'jjix', ['ꐚ'] = 'jji', ['ꐛ'] = 'jjip',
	['ꐜ'] = 'jjiet', ['ꐝ'] = 'jjiex', ['ꐞ'] = 'jjie', ['ꐟ'] = 'jjiep',
	['ꐠ'] = 'jjuox', ['ꐡ'] = 'jjuo', ['ꐢ'] = 'jjuop',
	['ꐣ'] = 'jjot', ['ꐤ'] = 'jjox', ['ꐥ'] = 'jjo', ['ꐦ'] = 'jjop',
	['ꐧ'] = 'jjut', ['ꐨ'] = 'jjux', ['ꐩ'] = 'jju', ['ꐪ'] = 'jjup',
	['ꐫ'] = 'jjurx', ['ꐬ'] = 'jjur',
	['ꐭ'] = 'jjyt', ['ꐮ'] = 'jjyx', ['ꐯ'] = 'jjy', ['ꐰ'] = 'jjyp',
	
	['ꐱ'] = 'njit', ['ꐲ'] = 'njix', ['ꐳ'] = 'nji', ['ꐴ'] = 'njip',
	['ꐵ'] = 'njiet', ['ꐶ'] = 'njiex', ['ꐷ'] = 'njie', ['ꐸ'] = 'njiep',
	['ꐹ'] = 'njuox', ['ꐺ'] = 'njuo',
	['ꐻ'] = 'njot', ['ꐼ'] = 'njox', ['ꐽ'] = 'njo', ['ꐾ'] = 'njop',
	['ꐿ'] = 'njux', ['ꑀ'] = 'nju', ['ꑁ'] = 'njup',
	['ꑂ'] = 'njurx', ['ꑃ'] = 'njur',
	['ꑄ'] = 'njyt', ['ꑅ'] = 'njyx', ['ꑆ'] = 'njy', ['ꑇ'] = 'njyp',
	['ꑈ'] = 'njyrx', ['ꑉ'] = 'njyr',
	['ꑊ'] = 'nyit', ['ꑋ'] = 'nyix', ['ꑌ'] = 'nyi', ['ꑍ'] = 'nyip',
	['ꑎ'] = 'nyiet', ['ꑏ'] = 'nyiex', ['ꑐ'] = 'nyie', ['ꑑ'] = 'nyiep',
	['ꑒ'] = 'nyuox', ['ꑓ'] = 'nyuo', ['ꑔ'] = 'nyuop',
	['ꑕ'] = 'nyot', ['ꑖ'] = 'nyox', ['ꑗ'] = 'nyo', ['ꑘ'] = 'nyop',
	['ꑙ'] = 'nyut', ['ꑚ'] = 'nyux', ['ꑛ'] = 'nyu', ['ꑜ'] = 'nyup',
	
	['ꑝ'] = 'xit', ['ꑞ'] = 'xix', ['ꑟ'] = 'xi', ['ꑠ'] = 'xip',
	['ꑡ'] = 'xiet', ['ꑢ'] = 'xiex', ['ꑣ'] = 'xie', ['ꑤ'] = 'xiep',
	['ꑥ'] = 'xuox', ['ꑦ'] = 'xuo',
	['ꑧ'] = 'xot', ['ꑨ'] = 'xox', ['ꑩ'] = 'xo', ['ꑪ'] = 'xop',
	['ꑫ'] = 'xyt', ['ꑬ'] = 'xyx', ['ꑭ'] = 'xy', ['ꑮ'] = 'xyp',
	['ꑯ'] = 'xyrx', ['ꑰ'] = 'xyr',
	
	['ꑱ'] = 'yit', ['ꑲ'] = 'yix', ['ꑳ'] = 'yi', ['ꑴ'] = 'yip',
	['ꑵ'] = 'yiet', ['ꑶ'] = 'yiex', ['ꑷ'] = 'yie', ['ꑸ'] = 'yiep',
	['ꑹ'] = 'yuot', ['ꑺ'] = 'yuox', ['ꑻ'] = 'yuo', ['ꑼ'] = 'yuop',
	['ꑽ'] = 'yot', ['ꑾ'] = 'yox', ['ꑿ'] = 'yo', ['ꒀ'] = 'yop',
	['ꒁ'] = 'yut', ['ꒂ'] = 'yux', ['ꒃ'] = 'yu', ['ꒄ'] = 'yup',
	['ꒅ'] = 'yurx', ['ꒆ'] = 'yur',
	['ꒇ'] = 'yyt', ['ꒈ'] = 'yyx', ['ꒉ'] = 'yy', ['ꒊ'] = 'yyp',
	['ꒋ'] = 'yyrx', ['ꒌ'] = 'yyr',
}

function export.tr(text, lang, sc)
	text = gsub(text, "('?'?'?)(%^?[^'])('?'?'?)", "%1%2%3 ")
	text = gsub(text, "%S", convert)
	text = gsub(text, "%^(%l)", string.upper)
	text = gsub(text, " $", "")
	
	return (text)
end

return export