-- Must keep only correct spellings.
local hom = {
	
	['กด'] = {'กช','กฎ','กด'},
	['กน'] = {'กน','กล'},
	['กอ'] = {'ก','ก.','กอ'},
	['กอบ'] = {'กอบ','กอปร'},
	['กอ-ระ-กด'] = {'กรกช','กรกฎ','กรกฏ'},
	['กะ-บิน'] = {'กบินทร์','กบิล','กะบิล'},
	['กะ-โบน'] = {'กโบร','กโบล'},
	['กะ-ปิ'] = {'กปิ','กะปิ'},
	['กะ-มะ-ลาด'] = {'กมลาศ','กมลาสน์'},
	['กะ-รัน'] = {'กรัณฑ์','กรัณย์'},
	['กะ-ลา'] = {'กลา','กะลา'},
	['กะ-สัด-ตฺรี'] = {'กษัตรี','กษัตรีย์'},
	['กะ-เสียน'] = {'เกษียณ','เกษียน','เกษียร'},
	['กะ-หฺรีด'] = {'กรีษ','กรีส'},
	['กัน'] = {'กรร','กรรฐ์','กรรณ','กรรม์','กัญ','กัณฐ์','กัณฑ์','กัณณ์','กัณห์','กัน','กันต์','กันย์','กัลป์'},
	['กัน-ดาน'] = {'กันดาร','กันดาล'},
	['กัน-ยา'] = {'กัญญา','กันยา'},
	['กัน-แสง'] = {'กรรแสง','กันแสง'},
	['กับ'] = {'กับ','กัป'},
	['กาด'] = {'กาจ','กาฐ','กาด','การ์ด'},
	['ก๊าด'] = {'ก๊าซ','ก๊าด','การ์ด'},
	['กาน'] = {'กาญจน์','กาน','กานต์','กานท์','การ','การณ์','การย์','กาล','กาฬ'},
	['กาบ'] = {'กาบ','กาพย์'},
	['กา-รัน'] = {'การันย์','การันต์'},
	['กา-รุน'] = {'การุญ','การุณย์'},
	['ก้าว'] = {'ก้าว','เก้า'},
	['กำ'] = {'กรรม','กำ'},
	['กำ-นัน'] = {'กำนัน','กำนัล'},
	['กำ-มะ-กอน'] = {'กรรมกร','กรรมกรณ์'},	
	['กำ-มาน'] = {'กรรมาร','กัมมาร'},
	['กุด'] = {'กุฏิ','กุด'},
	['กุน'] = {'กุณฑ์','กุน','กุล'},
	['กุม'] = {'กุม','กุมภ์'},
	['กูด'] = {'กูฏ','กูด'},
	['กูน'] = {'กูณฑ์','กูน'},
	['กฺรน'] = {'กรณฑ์','กรน'},
	['กฺระ-ดาด'] = {'กระดาด','กระดาษ'},
	['กฺระ-บวน'] = {'กระบวน','กระบวร'},
	['กฺระ-เบน'] = {'กระเบญ','กระเบน'},
	['กฺระ-สาบ'] = {'กระษาปณ์','กระสาบ'},
	['กฺระ-เสียน'] = {'กระเษียร','กระเสียน','กระเสียร'},
	['กฺระ-ไส'] = {'กระษัย','กระไส'},
	['กฺระ-หฺนก'] = {'กระนก','กระหนก'},
	['กฺราว'] = {'กราว','กราวด์'},
	['กฺรำ'] = {'กรัม','กรำ'},
	['กฺรี-ทา'] = {'กรีฑา','กรีธา'},
	['กฺลด'] = {'กลด','กลศ'},
	['เก'] = {'เก','เกย์'},
	['เกด'] = {'เกด','เกตุ','เกศ','เกส'},
	['เก็ด'] = {'เก็จ','เก็ด'},
	['เกน'] = {'เกณฑ์','เกน'},
	['เก-สา'] = {'เกศา','เกสา'},
	['เก-สี'] = {'เกศี','เกสี'},
	['เกา-บิน'] = {'เกาบิน','เกาบิล'},
	['เกียด'] = {'เกียจ','เกียด','เกียรติ'},
	['โกด'] = {'โกฏิ','โกฐ','โกศ','โกษ','โกส'},
	['โก-สน'] = {'โกศล','โกสน'},
	['โกฺรด'] = {'โกรด','โกรธ','โกรศ'},
	['ไก๊'] = {'ไก๊','ไกด์','ไก๊ด์'},
	['ขอ'] = {'ข','ข.','ขอ','ฃ','ฃอ'},
	['ขัด'] = {'ขัช','ขัด'},
	['ขัน'] = {'ขรรค์','ขัณฑ์','ขัน','ขันธ์'},
	['ขาน'] = {'ขาน','ขาล'},
	['ขีด-คั่น'] = {'ขีดขั้น','ขีดคั่น'},
	['เข็น'] = {'เข็ญ','เข็น'},
	['ไข'] = {'ขัย','ไข'},
	['คด'] = {'คช','คด','คต'},
	['คน'] = {'คน','คนธ์','คล'},
	['คม'] = {'คม','คมน์'},
	['ควน'] = {'ควณ','ควน','ควร'},
	['คอ'] = {'ค','ค.','คอ','คอร์','ฅ','ฅอ','ฆ'},
	['ค็่อน'] = {'ข้อน','ค่อน'}, --short
	['ค็่อย'] = {'ข้อย','ค่อย'}, --short
	['ค้อส'] = {'คอร์ส','คอส'},
	['คะ-นะ'] = {'คณะ','ฆน','ฆนะ'},
	['คัด'] = {'คัด','คัต'},
	['คัน'] = {'ครรภ์','คัน','คันถ์','คันธ์','คัล'},
	['คั่น'] = {'ขั้น','คั่น'},
	['คั่ว'] = {'ขั้ว','คั่ว'},
	['ค่า'] = {'ข้า','ค่า','ฆ่า'},
	['ค่าง'] = {'ข้าง','ค่าง'},
	['คาด'] = {'คาด','คาธ','คาส','ฆาต'},
	['คาน'] = {'คาน','ฆาน'},
	['คำ-นวน'] = {'คำนวณ','คำนวร'},
	['คี่'] = {'ขี้','คี่'},
	['คุด'] = {'คุด','คุต'},
	['คูน'] = {'คูณ','คูน'},
	['คฺราด'] = {'คราด','คราส'},
	['คฺรึน'] = {'คฤนถ์','ครึน'},
	['คฺวั่น'] = {'ขวั้น','ควั่น'},
	['คฺวาน'] = {'ควาญ','ควาน'},
	['เคียน'] = {'เคียน','เคียร'},
	['เคี่ยว'] = {'เขี้ยว','เคี่ยว'},
	['แค'] = {'แค','แคร์'},
	['โคด'] = {'โคตร','โฆษ'},
	['งอ'] = {'ง','ง.','งอ'},
	['จน'] = {'จญ','จน','จล','จลน์'},
	['จอ'] = {'จ','จ.','จอ'},
	['จอน'] = {'จร','จอน'},
	['จะ-หฺรด'] = {'จรด','จรส'},
	['จัก'] = {'จัก','จักร'},
	['จัน'] = {'จรรย์','จัณฑ์','จัน','จันท์','จันทร์','จันทน์'},
	['จัน-โจด'] = {'จันโจษ','จรรโจษ'},
	['จาก'] = {'จาก','จาค'},
	['จาน'] = {'จาน','จาร'},
	['จาบ'] = {'จาบ','จาป'},
	['จำ'] = {'จรรม','จำ'},
	['จำ-นัน'] = {'จำนรรจ์','จำนัล'},
	['จำ-เนียน'] = {'จำเนียน','จำเนียร'},
	['จิด'] = {'จิต','จิตต์','จิตร'},
	['จุน'] = {'จุณ','จุน','จุล'},
	['โจด'] = {'โจท','โจทก์','โจทย์','โจษ'},
	['โจน'] = {'โจน','โจร','โจล'},
	['ไจ'] = {'ใจ','ไจ'},
	['ฉอ'] = {'ฉ','ฉ.'},
	['ฉัด'] = {'ฉัด','ฉัตร'},
	['ฉัน'] = {'ฉัน','ฉันท์'},
	['ฉาบ'] = {'ฉาบ','ฉาป'},
	['ฉิน'] = {'ฉิน','ฉินท์'},
	['เฉด'] = {'เฉด','เฉท'},
	['ชง'] = {'ชง','ชงฆ์'},
	['ชน'] = {'ชน','ชนม์','ชล'},
	['ชวน'] = {'ชวน','ชวร'},
	['ชอ'] = {'ช','ช.','ฌ'},
	['ช่อ'] = {'ฉ้อ','ช่อ'},
	['ช็อก'] = {'ช็อก','ชอล์ก'},
	['ชอน'] = {'ชร','ชอน'},
	['ชะ-เลง'] = {'ชะเลง','เชลง'},
	['ชัก'] = {'ชัก','ชัค'},
	['ชัด'] = {'ชัฏ','ชัด'},
	['ชาด'] = {'ชาด','ชาต','ชาติ'},
	['ช้าด'] = {'ชาด','ชาร์จ','ชาร์ต'},
	['ชาน'] = {'ชาญ','ชาน','ชาร','ชาล','ฌาน'},
	['ชำ-นัน'] = {'ชำนรร','ชำนัญ','ชำนัน'},
	['ชำ-เนียน'] = {'ชำเนียน','ชำเนียร'},
	['ชิด'] = {'ชิด','ชิต'},
	['ชิบ'] = {'ชิบ','ชิป'},
	['เช็ก'] = {'เช็ก','เช็ค'},
	['เชอ'] = {'เชอ','เฌอ'},
	['เชา'] = {'เชาว์','เชาวน์'},
	['เชียน'] = {'เชียร','เชียรณ์'},
	['แช'] = {'แช','แชร์'},
	['โชก'] = {'โชก','โชค'},
	['โชด'] = {'โชต','โชติ'},
	['ไช'] = {'ชัย','ไช','ไชย'},
	['ซวด'] = {'ซวด','ทรวด'},
	['ซอ'] = {'ซ','ซ.','ซอ','ทรอ'},
	['ซ็่อม'] = {'ซ่อม','ส้อม'}, --short
	['ซับ'] = {'ซับ','ทรัพย์'},
	['ซ่า'] = {'ซ่า','ซ่าส์'},
	['ซ่าง'] = {'ซ่าง','สร้าง'},
	['ซาบ'] = {'ซาบ','ทราบ'},
	['ซาย'] = {'ไซน์','ทราย'},
	['ซิก'] = {'ซิก','ซิกข์'},
	['ซิ่น'] = {'ซิ่น','สิ้น'},
	['ซิบ'] = {'ซิบ','ซิป'},
	['ซุบ'] = {'ซุบ','ซุป'},
	['ซู่'] = {'ซู่','สู้'},
	['เซ็่น'] = {'เซ่น','เส้น'}, --short
	['เซล'] = {'เซล','เซลล์','เซลส์'},
	['เซ่อ'] = {'เซ่อ','เซอร์'},
	['เซ่า'] = {'เศร้า','เส้า'},
	['เซี่ยว'] = {'เซี่ยว','เสี้ยว'},
	['แซ่'] = {'แซ่','แส้'},
	['โซม'] = {'โซม','โซรม','โทรม'},
	['ไซ'] = {'ไซ','ไทร'},
	['ไซ่'] = {'ไส้','ไสร้'},
	['ไซ้'] = {'ไซ้','ไซซ์','ไซต์','ไซร้'},
	['ดวด'] = {'ดวจ','ดวด'},
	['ดอ'] = {'ฎ','ด','ดอ'},
	['ดอน'] = {'ดร','ดอน'},
	['ดาด'] = {'ดาด','ดาษ'},
	['ดาน'] = {'ดาน','ดาร','ดาล'},
	['ดาม'] = {'ดาม','ดามพ์'},
	['ด้าย'] = {'ด้าย','ได้'},
	['ดาว'] = {'ดาว','ดาวน์'},
	['ดำ'] = {'ดำ','ดัมพ์'},
	['ดำ-นาน'] = {'ดำนาณ','ดำนาน'},
	['ดิด'] = {'ดิฐ','ดิตถ์','ดิษฐ์'},
	['ดุด'] = {'ดุจ','ดุด'},
	['ดุน'] = {'ดุน','ดุล','ดุลย์'},
	['ดุ-สิด'] = {'ดุษิต','ดุสิต'},
	['เดด'] = {'เดช','เดชน์','เดต'},
	['เด็ด'] = {'เด็จ','เด็ด'},
	['เดียน'] = {'เดียร','เดียรถ์'},
	['โดน'] = {'โดน','โดร','โดรณ'},
	['ได'] = {'ใด','ได','ไดร์'},
	['ตอ'] = {'ฏ','ต','ต.','ตอ'},
	['ตะ-เค่'] = {'ตะเข้','ตะเฆ่'},
	['ตัก'] = {'ตรรก','ตัก','ตักร'},
	['ตัด'] = {'ตัด','ตัถย์'},
	['ตาน'] = {'ตาน','ตาล','ตาฬ'},
	['ต้าย'] = {'ใต้','ไต้'},
	['ตุน'] = {'ตุน','ตุล','ตุลย์'},
	['ตฺรวด'] = {'ตรวจ','ตรวด'},
	['ตฺรี'] = {'ตรี','ตฤๅ'},
	['เตียน'] = {'เตียน','เตียรถ์'},
	['ไตฺร'] = {'ตรัย','ไตร'},
	['ถอ'] = {'ฐ','ถ','ถ.'},
	['ถะ-หฺวัน'] = {'ถวัล','ถวัลย์'},
	['ถะ-หฺวิน'] = {'ถวิน','ถวิล'},
	['ถาน'] = {'ฐาน','ถาน'},
	['ถุน'] = {'ถุน','ถุล'},
	['เถน'] = {'เถน','เถร'},
	['ทง'] = {'ธง','ธงก์'},
	['ทด'] = {'ทด','ทท','ทศ'},
	['ทน'] = {'ทน','ทนต์','ทล'},
	['ท่วย'] = {'ถ้วย','ท่วย'},
	['ทอ'] = {'ฑ','ฒ','ท','ท.','ทอ','ธ','ธ.'},
	['ท็่อง'] = {'ถ้อง','ท่อง'}, --short
	['ทอน'] = {'ทอน','ธร'},
	['ทอ-ระ-มาน'] = {'ทรมาน','ธรมาน'},
	['ทอ-ระ-ราด'] = {'ทรราช','ทรราชย์'},
	['ทะ-ลาย'] = {'ทลาย','ทะลาย'},
	['ทะ-วาย'] = {'ทวาย','ทะวาย'},
	['ทะ-วิ-บด'] = {'ทวิบถ','ทวิบท'},
	['ทัก'] = {'ทัก','ทักข์','ทักษ์'},
	['ทัด'] = {'ทัด','ทัต','ทัศ','ทัศน์','ธัช'},
	['ทัน'] = {'ทัณฑ์','ทัน','ทันต์','ทันธ์','ธรรม์','ธัญ'},
	['ทับ'] = {'ทรรป','ทรรปณ์','ทับ','ทัพ'},
	['ทับ-ปะ-นะ'] = {'ทรรปณะ','ทัปนะ'},
	['ท่า'] = {'ถ้า','ท่า'},
	['ทาด'] = {'ทาษ','ทาส','ธาตุ'},
	['ทาน'] = {'ทาน','ทานต์','ทาร','ธาร'},
	['ทา-ยาด'] = {'ทายาด','ทายาท'},
	['ท้าว'] = {'ท้าว','เท้า'},
	['ทำ'] = {'ทำ','ธรรม'},
	['ทิ-คำ-พอน'] = {'ทิคัมพร','ทิฆัมพร'},
	['ทิด'] = {'ทิช','ทิด','ทิต','ทิศ'},
	['ทิบ'] = {'ทิป','ทิพ','ทิพย์'},
	['ทุก'] = {'ทุก','ทุกข์'},
	['ทุด'] = {'ทุส','ธุช','ธุต'},
	['ทูน'] = {'ทูน','ทูล'},
	['ทูบ'] = {'ทูบ','ธูป'},
	['เท'] = {'เท','เทห์'},
	['เทด'] = {'เทศ','เทศน์'},
	['เท-พิน'] = {'เทพิน','เทพินทร์'},
	['เท-วัน'] = {'เทวัญ','เทวัน'},
	['เท่า'] = {'เฒ่า','เถ้า','เท่า'},
	['เทิน'] = {'เทอญ','เทิน','เทิร์น'},
	['เทียน'] = {'เทียน','เทียร','เทียรฆ์','เธียร'},
	['โท'] = {'โท','โทร'},
	['โท-ระ-ทัด'] = {'โทรทรรศน์','โทรทัศน์'},
	['ไท'] = {'ไท','ไทย'},
	['นบ'] = {'นบ','นพ','นภ'},
	['นอ'] = {'ณ','น','น.','นอ'},
	['นอ-ระ-กาน'] = {'นรกานต์','นรการ'},
	['นะ'] = {'ณ','นะ'},
	['นัก'] = {'นัก','นัข','นัค'},
	['นัด'] = {'นัจ','นัฏ','นัฑ','นัด','นัตถุ์'},
	['น่า'] = {'น่า','หน้า'},
	['นาก'] = {'นาก','นาค'},
	['นาด'] = {'นาฏ','นาด','นาถ','นาท','นาศ'},
	['นิด'] = {'นิจ','นิด','นิตย์','นิติ','นิทร'},
	['นิ-ติ-กอน'] = {'นิติกร','นิติกรณ์'},
	['นิ-ติ-กาน'] = {'นิติการ','นิติการณ์'},
	['นิ-ทาน'] = {'นิทาน','นิธาน'},
	['นิ-ระ-มาน'] = {'นิรมาณ','นิรมาน'},
	['นิ-โรด'] = {'นิโรช','นิโรธ'},
	['นิ-วาด'] = {'นิวาต','นิวาส'},
	['นิ-สาด'] = {'นิษาท','นิสาท'},
	['นี่'] = {'นี่','หนี้'},
	['นุด'] = {'นุช','นุด','นุต'},
	['เน-ระ-นาด'] = {'เนรนาด','เนรนาถ'},
	['เน่า'] = {'เน่า','เหน้า'},
	['เนียน'] = {'เนียน','เนียร'},
	['ไน'] = {'นัย','นัยน์','ใน','ไน'},
	['บง'] = {'บง','บงก์','บงสุ์'},
	['บด'] = {'บฏ','บด','บถ','บท'},
	['บอ'] = {'บ','บ.','บอ'},
	['บ่อ'] = {'บ่','บ่อ'},
	['บอด'] = {'บอด','บอร์ด'},
	['บอ-พิด'] = {'บพิตร','บพิธ'},
	['บอ-ริ-พัน'] = {'บริพันธ์','บริภัณฑ์'},
	['บะ-หฺรัด'] = {'บรัด','บรัศว์'},
	['บัง-คน'] = {'บังคน','บังคล'},
	['บัด'] = {'บัฏ','บัด','บัตร','บัทม์'},
	['บัน'] = {'บรรณ','บรรพ์','บัน','บัล'},
	['บัน-ดิด'] = {'บัณฑิต','บัณฑิตย์'},
	['บัน-เดาะ'] = {'บัณเฑาะก์','บัณเฑาะว์'},
	['บัน-ยง'] = {'บรรยง','บรรยงก์'},
	['บัน-หฺลาด'] = {'บัลลาด','บัลลาสต์'},
	['บับ'] = {'บรรพ','บัพ'},
	['บา'] = {'บา','บาร์'},
	['บาด'] = {'บาด','บาต','บาตร','บาท','บาศ','บาศก์'},
	['บาน'] = {'บาน','บาล'},
	['บิด'] = {'บิฐ','บิด','บิต'},
	['บิน'] = {'บิณฑ์','บิน'},
	['บุด'] = {'บุด','บุตร','บุษย์'},
	['บุบ'] = {'บุบ','บุพ'},
	['บูน'] = {'บูร','บูรณ์','บูรพ์'},
	['ไบ'] = {'ใบ','ไบ'},
	['ปอ'] = {'ป','ป.','ปอ'},
	['ปอน'] = {'ปอน','ปอนด์'},
	['ปะ-ติ'] = {'ปฏิ','ปติ'},
	['ปะ-ติ-พาก'] = {'ปฏิพากย์','ปฏิภาค'},
	['ปะ-ติ-วัด'] = {'ปฏิวัติ','ปติวัตร'},
	['ปะ-ถะ-พี'] = {'ปฐพี','ปถพี'},
	['ปะ-ริ-พัน'] = {'ปริพันธ์','ปริภัณฑ์'},
	['ปะ-ริ-พาด'] = {'ปริภาษ','ปริภาษณ์'},
	['ปะ-ริ-หาน'] = {'ปริหาน','ปริหาร'},
	['ปะ-วาน'] = {'ปวาล','ปวาฬ'},
	['ปะ-วิด'] = {'ปวิช','ปวิตร','ปวิธ'},
	['ปะ-สาด'] = {'ปสาท','ปสาสน์'},
	['ปะ-หาน'] = {'ปหาน','ปหาร'},
	['ปะ-หฺรอด'] = {'ปรอด','ปรอท'},
	['ปะ-หฺรัด'] = {'ปรัด','ปรัศว์'},
	['ปัก'] = {'ปัก','ปักข์','ปักษ์'},
	['ปัง'] = {'ปัง','ปังสุ์'},
	['ปัด'] = {'ปัฏ','ปัด','ปัทม์'},
	['ปาด'] = {'ปาด','ปาท','ปาส'},
	['ปาน'] = {'ปาน','ปาล'},
	['ปาม'] = {'ปาม','ปาล์ม'},
	['ปุด'] = {'ปุฏ','ปุด','ปุตต์'},
	['ปฺระ-กิด'] = {'ประกิด','ประกิต'},
	['ปฺระ-กฺริด'] = {'ประกฤต','ประกฤติ'},
	['ปฺระ-จัน'] = {'ประจัญ','ประจัน'},
	['ปฺระ-จาก'] = {'ประจาก','ประจาค'},
	['ปฺระ-ทาน'] = {'ประทาน','ประธาน'},
	['ปฺระ-ทุด'] = {'ประทุฐ','ประทุษ','ประทุษฐ์'},
	['ปฺระ-พัด'] = {'ประพัด','ประพัทธ์'},
	['ปฺระ-พาด'] = {'ประพาต','ประพาส','ประภาษ','ประภาส'},
	['ปฺระ-พฺรึด'] = {'ประพฤติ','ประพฤทธิ์'},
	['ปฺระ-มวน'] = {'ประมวญ','ประมวล'},
	['ปฺระ-วัด'] = {'ประวรรต','ประวรรตน์'},
	['ปฺระ-วาด'] = {'ประวาต','ประวาส'},
	['ปฺระ-วิด'] = {'ประวิช','ประวิตร'},
	['ปฺระ-สบ'] = {'ประสบ','ประสพ'},
	['ปฺระ-สม'] = {'ประศม','ประสม'},
	['ปฺระ-สาด'] = {'ประศาสน์','ประสาท','ประสาธน์'},
	['ปฺระ-สาน'] = {'ประสาน','ประสาร'},
	['ปฺระ-สูด'] = {'ประสูต','ประสูติ'},
	['ปฺระ-หาน'] = {'ประหาณ','ประหาร'},
	['ปฺระ-หฺวัด'] = {'ประวัติ','ประหวัด'},
	['ปฺระ-หฺวัด-กาน'] = {'ประวัติการ','ประวัติการณ์'},
	['ปฺระ-หฺวัด-ติ-กาน'] = {'ประวัติการ','ประวัติการณ์'},
	['ปฺราง'] = {'ปราง','ปรางค์'},
	['ปฺราด'] = {'ปราชญ์','ปราด','ปราศ'},
	['ปฺราน'] = {'ปราณ','ปราน'},
	['ปฺรา-นี'] = {'ปราณี','ปรานี'},
	['ปฺราบ'] = {'ปราบ','ปราปต์'},
	['ปฺรา-ไส'] = {'ปราศรัย','ปราสัย'},
	['ผอ'] = {'ผ','ผ.'},
	['ผะ-เอิน'] = {'เผอิญ','เผอิล'},
	['ฝอ'] = {'ฝ','ฝ.'},
	['พง'] = {'พง','พงศ์'},
	['พด'] = {'พจน์','พด'},
	['พน'] = {'พน','พล'},
	['พบ'] = {'พบ','ภพ'},
	['พอ'] = {'พ','พ.','พอ','ภ','ภ.'},
	['พอน'] = {'พร','พอน'},
	['พะ-นะ'] = {'พน','ภณะ'},
	['พะ-นิด'] = {'พณิช','พณิชย์'},
	['พะ-ยด'] = {'พยชน์','พยศ'},
	['พะ-ยัก'] = {'พยัก','พยัคฆ์'},
	['พะ-ยาน'] = {'พยาน','พยาล'},
	['พะ-ยุ'] = {'พยุ','พยุห์'},
	['พัก'] = {'พรรค','พัก','พักตร์','พักร','ภักดิ์','ภักษ์','ภัค','ภัคน์'},
	['พัด'] = {'พรรษ','พัช','พัฒน์','พัด','พัตร','พัทธ์','พัสตร์','ภัจ','ภัต','ภัตต์','ภัตร','ภัทร'},
	['พัน'] = {'พรรค์','พรรณ','พัญจน์','พัน','พันธ์','พันธน์','พันธุ์','ภัณฑ์'},
	['พับ'] = {'พับ','ภัพ'},
	['พา'] = {'พา','ภา'},
	['พ่า'] = {'ผ้า','พ่าห์'},
	['พาก'] = {'พาก','พากย์','ภาค','ภาคย์'},
	['พา-ชี'] = {'พาชี','ภาชี'},
	['พาด'] = {'พาด','พาต','พาท','พาทย์','พาธ','พาส','พาสน์','ภาษ','ภาษณ์','ภาส','ภาสน์'},
	['พาน'] = {'พาณ','พาน','พาล','พาฬ','ภาณ','ภาร'},
	['พา-นิด'] = {'พาณิช','พาณิชย์','พานิช'},
	['พา-นิ-นี'] = {'พาณินี','ภาณินี'},
	['พา-นี'] = {'พาณี','ภาณี'},
	['พาบ'] = {'ภาพ','ภาพย์'},
	['พาม'] = {'พาม','ภาม'},
	['พาย'] = {'พาย','ภาย'},
	['พ่าย'] = {'ผ้าย','พ่าย'},
	['พา-รา'] = {'พารา','ภารา'},
	['พา-ลี'] = {'พาลี','พาฬี'},
	['พิ-กัด'] = {'พิกัด','พิกัติ'},
	['พิ-จิด'] = {'พิจิต','พิจิตร'},
	['พิด'] = {'พิชญ์','พิตร','พิทย์','พิศ','พิษ','ภิท','ภิส'},
	['พิน'] = {'พิณ','ภิน','ภินท์','ภินทน์'},
	['พิ-นิด'] = {'พินิจ','พินิต','พินิศ'},
	['พิ-พัด'] = {'พิพัฒ','พิพัฒน์','พิภัช'},
	['พิ-พาก'] = {'พิพากษ์','พิภาค'},
	['พิ-รุน'] = {'พิรุณ','พิรุฬห์'},
	['พิ-โลน'] = {'พิโลน','พิโลล'},
	['พิ-สัด'] = {'พิสัช','ภิษัช'},
	['พึ่ง'] = {'ผึ้ง','พึ่ง'},
	['พืด'] = {'พืช','พืด'},
	['พุก'] = {'พุก','ภุกต์'},
	['พุด'] = {'พุฒ','พุด','พุทธ','พุธ','ภุช','ภุต','ภุส'},
	['พู'] = {'พู','ภู'},
	['พู่'] = {'ผู้','พู่','ภู่'},
	['พูด'] = {'พูด','ภูต'},
	['พฺรม'] = {'พรม','พรหม'},
	['พฺรึด'] = {'พฤฒ','พฤต','พฤติ','พฤทธ์','พฤทธิ์','ภฤตย์','ภฤศ','ภฤษฏ์'},
	['พฺรึน'] = {'พฤนต์','พฤนท์'},
	['พฺรู'] = {'พรู','ภรู'},
	['พฺลำ'] = {'พลัม','พลำ'},
	['เพด'] = {'เพฐน์','เพตร','เพท','เพศ','เพส','เภท'},
	['เพ็ด'] = {'เพ็จ','เพชร'},
	['เพียน'] = {'เพียน','เพียร'},
	['เพฺริด'] = {'เพริด','เพริศ'},
	['แพด'] = {'แพทย์','แพศย์'},
	['โพก'] = {'โพก','โภค'},
	['โพด'] = {'โพด','โพธ','โภช','โภชย์','โภชน์'},
	['ไพ'] = {'ไพ','ภัย'},
	['ไพ-ริน'] = {'ไพริน','ไพรินทร์','ไภริน'},
	['ไพ-รี'] = {'ไพรี','ไภรี'},
	['ฟอ'] = {'ฟ','ฟ.'},
	['ฟิด'] = {'ฟิด','ฟิต'},
	['มน'] = {'มณฑ์','มน','มนต์','มนตร์','มนท์','มล'},
	['มวน'] = {'มวน','มวล'},
	['มอ'] = {'ม','ม.','มอ'},
	['มอน'] = {'มรณ์','มอญ','มอน'},
	['ม็อบ'] = {'ม็อบ','ม็อป'},
	['มะ-หัน'] = {'มหันต์','มหัล'},
	['มะ-เห-สัก'] = {'มเหศักดิ์','มเหสักข์'},
	['มัก'] = {'มรรค','มัก','มัคค์'},
	['มัด'] = {'มัด','มัตต์'},
	['มัด-ทะ-ยะ'] = {'มัทยะ','มัธย'},
	['มัน'] = {'มัน','มันส์'},
	['มั่น'] = {'มั่น','หมั้น'},
	['มา'] = {'มา','มาห์'},
	['มาก'] = {'มาก','มารค'},
	['มาด'] = {'มาด','มาตร','มาท','มาศ','มาส'},
	['มาน'] = {'มาน','มาร','มาลย์'},
	['มา-นบ'] = {'มาณพ','มานพ'},
	['มา-นัด'] = {'มานัต','มานัส'},
	['มิด'] = {'มิด','มิตร','มิศร์'},
	['มีน'] = {'มีน','มีฬห์'},
	['มุก'] = {'มุก','มุข','มุคธ์'},
	['มุด-ทา'] = {'มุททา','มุทธา'},
	['มูน'] = {'มูน','มูล'},
	['เม'] = {'เม','เมล์','เมห์'},
	['เมน'] = {'เมน','เมรุ'},
	['เม้า'] = {'เม้า','เมาท์'},
	['เมิน'] = {'เมิน','เมิล'},
	['โม่'] = {'โม่','โม่ห์'},
	['โมก'] = {'โมก','โมกข์'},
	['ไม่'] = {'ไม่','ไหม้'},
	['ไม-ยะ-ราบ'] = {'ไมยราบ','ไมยราพ'},
	['ยน'] = {'ยนต์','ยนตร์','ยล'},
	['ยวน'] = {'ญวน','ยวน'},
	['ยอ'] = {'ญ','ญ.','ย','ยอ'},
	['ยัก'] = {'ยัก','ยักข์','ยักษ์'},
	['ยัด'] = {'ยัชน์','ยัด'},
	['ยัน'] = {'ยัญ','ยัน','ยันต์','ยันตร์'},
	['ย่า'] = {'ย่า','หญ้า'},
	['ยาด'] = {'ญาติ','ยาตร'},
	['ยาน'] = {'ญาณ','ยาน'},
	['ยิบ'] = {'ญิบ','ยิบ'},
	['ยี่'] = {'ยี่','ญี่'},
	['ยุก'] = {'ยุกต์','ยุค'},
	['ยุด'] = {'ยุด','ยุต','ยุทธ์'},
	['ยุบ'] = {'ยุบ','ยุพ'},
	['เยา'] = {'เยา','เยาว์'},
	['โยก'] = {'โยก','โยกต์'},
	['โยด'] = {'โยชน์','โยด','โยต'},
	['ไย'] = {'ใย','ไย'},
	['รง'] = {'รง','รงกุ์','รงค์'},
	['รด'] = {'รด','รถ','รท','รส'},
	['รน'] = {'รณ','รน'},
	['รบ'] = {'รบ','รพ'},
	['รม'] = {'รม','รมย์'},
	['รม-มะ-นี'] = {'รมณี','รมณีย์'},
	['รอ'] = {'ร','ร.','รอ'},
	['ระ-ยะ'] = {'รยะ','ระยะ'},
	['ระ-หัด'] = {'รหัท','รหัส','รหัสย์','ระหัด'},
	['รัก'] = {'รัก','รักข์','รักษ์'},
	['รัง'] = {'รัง','รังค์'},
	['รัด'] = {'รัช','รัชต์','รัชน์','รัฐ','รัด','รัต','รัตน์','รัถ'},
	['รา-ชัน'] = {'ราชัน','ราชันย์'},
	['ราด'] = {'ราช','ราชย์','ราด','ราต','ราตร','ราษฎร์'},
	['ราน'] = {'ราญ','ราน'},
	['ราบ'] = {'ราบ','ราพณ์'},
	['รำ'] = {'รัมย์','รำ'},
	['รำ-หัด'] = {'รำหัด','รำหัส'},
	['ริด'] = {'ริด','ฤทธิ์'},
	['รีด'] = {'รีด','รีต'},
	['รึ'] = {'รึ','ฤ'},
	['รุก'] = {'รุก','รุกข์'},
	['รุด'] = {'รุจ','รุจน์','รุด','รุต','รุทธ์','รุษฏ์'},
	['โรด'] = {'โรจ','โรจน์','โรท','โรธ','โรษ'},
	['โร-มัน'] = {'โรมัญจ์','โรมัน'},
	['ไร'] = {'รัย','ไร'},
	['ไร้'] = {'ไร้','ไรต์'},
	['ลบ'] = {'ลบ','ลพ'},
	['ลอ'] = {'ล','ล.','ลอ','ฬ'},
	['ลัก'] = {'ลัก','ลักข์','ลักษณ์','ลักษมณ์','ลัคน์'},
	['ลัด'] = {'ลัด','ลัทธ์'},
	['ลัน'] = {'ลัญจ์','ลัญฉ์','ลัน'},
	['ลับ'] = {'ลับ','ลัพธ์','ลัภ','ลัภย์'},
	['ล่า'] = {'ล่า','หล้า'},
	['ลาด'] = {'ลาช','ลาด'},
	['ลาน'] = {'ลาญ','ลาน'},
	['ลาบ'] = {'ลาบ','ลาป','ลาภ'},
	['ลิง'] = {'ลิง','ลิงค์'},
	['ลิด'] = {'ลิด','ลิต','ลิตร'},
	['ลิบ'] = {'ลิบ','ลิป','ลิปต์','ลิฟต์'},
	['ลือ'] = {'ลือ','ฦๅ'},
	['ลือ-ชา'] = {'ลือชา','ฦๅชา'},
	['ลือ-สาย'] = {'ลือสาย','ฦๅสาย'},
	['ลุด'] = {'ลุต','ลุท','ลุทธ์'},
	['ลุบ'] = {'ลุปต์','ลุพธ์'},
	['เลก'] = {'เลก','เลข'},
	['เลด'] = {'เลต','เลศ'},
	['เล็น'] = {'เลนส์','เล็น'},
	['เล่า'] = {'เล่า','เหล้า'},
	['โลด'] = {'โลด','โลท'},
	['วง'] = {'วง','วงก์','วงศ์','วงษ์'},
	['วอ'] = {'ว','ว.','วอ','วอร์'},
	['วะ-ตะ'] = {'วฏ','วต','วตะ'},
	['วะ-นิด'] = {'วณิช','วณิชย์'},
	['วะ-ลัน'] = {'วลัญช์','วลัณชน์'},
	['วัก'] = {'วรรค','วรรคย์','วัก','วัค'},
	['วัง'] = {'วัง','วังก์'},
	['วัด'] = {'วรรช','วรรชย์','วรรษ','วัจฉ์','วัจน์','วัช','วัชฌ์','วัฏ','วัฒน์','วัด','วัต','วัตถ์','วัตร','วัติ','วัทน์','วัสตร์','วัสน์'},
	['วัด-สะ'] = {'วรรษ','วัตสะ','วัส','วัสสะ'},
	['วัน'] = {'วรรณ','วัญฌ์','วัณ','วัณฏ์','วัน','วันต์','วันท์','วัลก์','วัลย์'},
	['ว่า'] = {'ว่า','หว้า'},
	['วาด'] = {'วาด','วาต','วาท','วาทย์'},
	['วาน'] = {'วาน','วาร','วาล','วาฬ'},
	['วา-นิด'] = {'วานิช','วาณิชย์'},
	['วาย'] = {'วาย','ไวน์'},
	['ว่าย'] = {'ว่าย','ไหว้'},
	['วาว'] = {'วาล์ว','วาว'},
	['วิ-กาน'] = {'วิการ','วิกาล'},
	['วิ-คาด'] = {'วิฆาต','วิฆาส'},
	['วิ-จิด'] = {'วิจิต','วิจิตร'},
	['วิด'] = {'วิด','วิทย์','วิธ'},
	['วิ-ทาน'] = {'วิทารณ์','วิทาลน์'},
	['วิ-ทู'] = {'วิทู','วิธู'},
	['วิ-ทูน'] = {'วิฑูรย์','วิทูร'},
	['วิ-นิด'] = {'วินิจ','วินิต'},
	['วิ-พาก'] = {'วิพากษ์','วิภาค'},
	['วิ-พาด'] = {'วิภาช','วิภาษ','วิภาส'},
	['วิ-มน'] = {'วิมน','วิมล'},
	['วิ-รัด'] = {'วิรัช','วิรัติ'},
	['วิ-โรด'] = {'วิโรจ','วิโรจน์','วิโรฒ','วิโรธ','วิโรธน์'},
	['วิ-ลาด'] = {'วิลาด','วิลาศ','วิลาส'},
	['วิ-ไล'] = {'วิลัย','วิไล'},
	['วิ-วัด'] = {'วิวรรธน์','วิวัฏ','วิวัฒน์'},
	['วิ-วิด'] = {'วิวิจ','วิวิต','วิวิธ'},
	['วิ-สาน'] = {'วิษาณ','วิสาร'},
	['วิ-เสด'] = {'วิเศษ','วิเศษณ์','วิเสท'},
	['วุด'] = {'วุฐิ','วุฒ','วุฒิ','วุด'},
	['เวด'] = {'เวช','เวฐน์','เวตน์','เวตร','เวท','เวทย์','เวธ','เวศม์','เวศย์','เวสน์','เวสม์'},
	['เวน'] = {'เวน','เวร'},
	['เวียน'] = {'เวียน','เวียร'},
	['แวด'] = {'แวด','แวตร'},
	['ไว'] = {'วัย','ไว','ไวทย์'},
	['สก'] = {'ศก','สก'},
	['สง'] = {'สง','สงค์','สงฆ์','สรง'},
	['สง-กา'] = {'ศงกา','สงกา'},
	['สน'] = {'สณฑ์','สน'},
	['สน-ทัด'] = {'สนทรรศ','สนทรรศน์'},
	['สบ'] = {'ศพ','สบ'},
	['สม-โพด'] = {'สมโพธน์','สมโพธิ','สมโภช'},
	['สม-รด'] = {'สมรด','สมรส'},
	['สวน'] = {'สรวล','สวน'},
	['สวม'] = {'สรวม','สวม'},
	['สอ'] = {'ศ','ศ.','ศอ','ษ','ส','ส.','สอ'},
	['สอน'] = {'ศร','สร','สอน'},
	['สะ'] = {'สระ','สะ'},
	['สะ-กน'] = {'ศกล','สกนธ์','สกล'},
	['สะ-กะ-ตะ'] = {'ศกฏะ','สกฏ','สกฏะ'},
	['สะ-กุน'] = {'ศกุน','ศกุนต์','สกุณ','สกุน','สกุนต์','สกุล'},
	['สะ-เด็ด'] = {'สะเด็ด','เสด็จ'},
	['สะ-ตะ'] = {'ศต','ศตะ','สต','สตะ'},
	['สะ-ตะ-กะ'] = {'ศตกะ','สตกะ'},
	['สะ-ถน'] = {'สถน','สถล'},
	['สะ-ถะ'] = {'ศฐะ','สฐะ'},
	['สะ-ถาน'] = {'สถาน','สถาล'},
	['สะ-บด'] = {'สบจ','สบถ'},
	['สะ-พาบ'] = {'สพาบ','สภาพ'},
	['สะ-มัด'] = {'สมรรถ','สมัช','สมัต'},
	['สะ-มา'] = {'ษมา','สมา'},
	['สะ-มิด'] = {'สมิต','สมิทธ์'},
	['สะ-ยะ-นะ'] = {'ศยนะ','สยนะ'},
	['สะ-ระ-พะ'] = {'สรพะ','สรภะ'},
	['สะ-หฺนุก'] = {'สนุก','สนุข'},
	['สะ-หฺมุด'] = {'สมุด','สมุทร'},
	['สะ-หฺยาม'] = {'ศยาม','สยาม'},
	['สะ-หฺลิด'] = {'ศลิษฏ์','สลิด'},
	['สะ-เหฺลด'] = {'เศลษ','เศลษม์','เสลด'},
	['สะ-หฺวาด'] = {'สวาด','สวาดิ','สวาท','สวาสดิ์'},
	['สะ-เหฺวด'] = {'เศวต','เศวตร'},
	['สัก'] = {'สัก','สัค','ศักดิ์','ศักย์'},
	['สัง'] = {'สังข์','สังค์'},
	['สัง-กอน'] = {'ศังกร','สังกร'},
	['สัง-กา'] = {'ศังกา','สังกา'},
	['สัด'] = {'ษัฏ','ษัฑ','ษัษ','สัจ','สัด','สัต','สัตย์','สัตว์'},
	['สัด-ทา'] = {'ศรัทธา','สัทธา'},
	['สัน'] = {'ศัล','ศัลย์','สรร','สรรค์','สรรพ์','สัณฑ์','สัณห์','สัน','สันต์'},
	['สัน-ทาน'] = {'สันทาน','สันธาน'},
	['สับ'] = {'ศัพท์','สรรพ','สับ','สัพ'},
	['สาก'] = {'ศาก','สาก'},
	['สาด'] = {'ศราทธ์','ศาต','ศารท','ศาสตร์','ศาสน์','สาด','สาต','สารท','สาสน์'},
	['สา-ทิด'] = {'สาทิส','สาธิต'},
	['สา-ทุ'] = {'สาทุ','สาธุ'},
	['สาน'] = {'ศาณ','ศานต์','ศาล','สาน','สาร'},
	['สาบ'] = {'ศาป','สาบ','สาป'},
	['สา-มน'] = {'สามนต์','สามล'},
	['สา-ระ-บัน'] = {'สารบรรณ','สารบัญ'},
	['สา-ระ-พี'] = {'สารพี','สารภี'},
	['สำ-พาด'] = {'สัมพาธ','สัมภาษณ์'},
	['สำ-ริด'] = {'สัมฤทธิ์','สำริด'},
	['สิ-ขา'] = {'ศิขา','สิขา'},
	['สิง'] = {'สิง','สิงค์','สิงห์'},
	['สิง-คาน'] = {'ศฤงคาร','สิงคาร','สิงคาล'},
	['สิด'] = {'ศิษฏ์','ศิษย์','สิท','สิทธ์','สิทธิ์'},
	['สิน'] = {'สิญจน์','สิน'},
	['สี'] = {'ศรี','สี','สีห์'},
	['สึก'] = {'ศึก','สึก'},
	['สุก'] = {'ศุกร์','สุก','สุกข์','สุข'},
	['สุ-จิด'] = {'สุจิต','สุจิตร'},
	['สุด'] = {'สุด','สุต','สุทธ์'},
	['สุด-ทิ'] = {'ศุทธิ','สุทธิ'},
	['สุบ-พะ'] = {'ศุภ','สุภ'},
	['สูด'] = {'ศูทร','สูด','สูต','สูต','สูตร','สูท'},
	['สูน'] = {'ศูนย์','ศูล','สูญ','สูร','สูรย์'},
	['เสด'] = {'เศรษฐ์','เศษ'},
	['เส-นี'] = {'เสณี','เสนี','เสนีย์'},
	['เสา'] = {'เศาร์','เสา','เสาร์'},
	['โสด'] = {'โสด','โสต','โสรจ'},
	['โสม'] = {'โสม','โสมย์'},
	['ไส'] = {'สัยน์','ใส','ไส','ไสย'},
	['ไส-ยา'] = {'ศัยยา','ไสยา'},
	['หง'] = {'หง','หงส์'},
	['หอ'] = {'ห','ห.','หอ'},
	['หัด'] = {'หัจญ์','หัช','หัด','หัต','หัตถ์','หัส','หัสต์'},
	['หาน'] = {'หาญ','หาร'},
	['หิด'] = {'หิด','หิต'},
	['หิ-รัน'] = {'หิรัญ','หิรัณย์'},
	['หฺลอด'] = {'ลอร์ด','หลอด'},
	['หฺย่า'] = {'หย่า','อย่า'},
	['หฺยิบ'] = {'หญิบ','หยิบ'},
	['เห็ด'] = {'เห็จ','เห็ด'},
	['เหฺน็ด'] = {'เน็ต','เหน็ด'},
	['โหน'] = {'โหน','โหร'},
	['โหฺวด'] = {'โหวด','โหวต'},
	['ไห'] = {'หัย','ไห'},
	['อง'] = {'อง','องก์','องค์','องศ์'},
	['อวน'] = {'อวน','อวล'},
	['ออ'] = {'อ','อ.','ออ','ออร์'},
	['ออ-ระ-หัน'] = {'อรหัน','อรหันต์'},
	['อะ-นัน'] = {'อนัญ','อนันต์','อนันตร์'},
	['อะ-นุ-สอน'] = {'อนุสร','อนุสรณ์'},
	['อะ-นุ-สาด'] = {'อนุศาสน์','อนุสาสน์'},
	['อะ-พิ-วัน'] = {'อภิวัน','อภิวันทน์'},
	['อะ-พิ-สิด'] = {'อภิสิต','อภิสิทธิ์'},
	['อะ-รัน'] = {'อรัญ','อรัณย์'},
	['อัก'] = {'อรรค','อรรฆ','อรรฆย์','อัก'},
	['อัง'] = {'อัง','อังก์'},
	['อัง-คาด'] = {'อังคาส','อังฆาต'},
	['อัด'] = {'อรรจน์','อรรถ','อรรธ','อัฏ','อัฐ','อัฒ','อัด','อัต','อัตถ์','อัทธ์'},
	['อัน'] = {'อัน','อันต์'},
	['อา'] = {'อา','อาร์','อาว์'},
	['อา-จาน'] = {'อาจาร','อาจารย์'},
	['อาด'] = {'อาจ','อาด','อาตม์','อาสน์'},
	['อา-ทาน'] = {'อาธาน','อาธาร'},
	['อา-นน'] = {'อานน','อานนท์'},
	['อา-พัด'] = {'อาพัด','อาพัทธ์'},
	['อา-พาด'] = {'อาพาธ','อาภาส'},
	['อา-ยัด'] = {'อายัด','อายัต'},
	['อา-วุด'] = {'อาวุต','อาวุธ'},
	['อา-สิน'] = {'อาสิญจ์','อาสิน'},
	['อำ'] = {'อัม','อำ'},
	['อำ-นาด'] = {'อำนาจ','อำนาถ'},
	['อิง'] = {'อิง','อิงค์'},
	['อิด'] = {'อิฐ','อิด','อิศร','อิษฏ์','อิส'},
	['อิน'] = {'อิน','อินท์','อินทร์','อินธน์'},
	['อิน-ซี'] = {'อินทรี','อินทรีย์'},
	['อี-เมล'] = {'อีเมล','อีเมล์'},
	['อุก'] = {'อุก','อุค'},
	['อุด'] = {'อุจ','อุด'},
	['อุ-ทาน'] = {'อุทาน','อุทาร'},
	['อุ-บาด'] = {'อุบาท','อุบาทว์'},
	['อุ-สา'] = {'อุษา','อุสา'},
	['อูด'] = {'อูฐ','อูด'},
	['เอา-ทาน'] = {'เอาทาร','เอาทารย์'},
	['แอ'] = {'แอ','แอร์'},
	['โอด'] = {'โอช','โอฐ','โอด','โอษฐ์'},
	['ฮอ'] = {'ฮ','ฮ.'},
	['ไฮ่'] = {'ให้','ไห้'},
	
}

return hom