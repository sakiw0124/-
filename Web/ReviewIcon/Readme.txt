﻿# 需要一個快速看Icon風格的呈現清單，原本用Excel管理太累了
# ReviewIcon整個資料夾必須與Icon平行，batch搜尋與產生目錄、檔案，以及網頁內所寫的都是相對位置
# 需先將目錄與檔案清單產生為txt檔
# 全新重作使用createlistall.bat（內容會呼叫createfilelist.bat）
# 單補或重作一個網站的清單使用createlistbydir.bat（使用情境：增加一個網站，一個網站內有增加icon目錄）
# 重做一個網站+目錄的清單使用createsinglestyle.bat（使用情境：網站與目錄都存在，只增加了png檔案）
# 搜尋檔案的方法效能測試，使用檔案量龐大的iconshock.com/MATERIAL為測試依據
#	新方法（effn.bat）花48s
# 	16:06:53.90
# 	16:07:41.90
#	舊方法（effo.txt）花8m14s4ms
#	Start:16:06:51.80
#	End:16:15:06.20
#配合angular2專案，資料清單從txt改為json；style改為series