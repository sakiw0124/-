# -
各式成果

20170809 Windows_Batch
VPN連上後，自動增加路由。可是不知道怎麽將指令寫入到變數，只好Echo出結果再自己輸入。
robamcmd.bat指令前的變數收集(詢問放入變數、疊加檔案內容、執行完畢停留在cmd)
robamroute.bat自動產生出的batch，必須要用系統管理員執行
將兩個bat放在開始畫面，先改為exe，放入開始畫面，改回bat，內容目標改為bat，
缺點就是....改回來bat以後，就不能直接在開始畫面按右鍵系統管理員執行。

20170811 Windows_Batch
robamcmd.bat直接從指令找出路由，自動寫入執行檔robamroute.bat
1. 指令用for取得內容字串，指令包含雙引號，必須+usebackq屬性
2. |不能用要+^
3. DO後面接想做的事情，還不知道為什麼%i下一行取不到，所以只好讓DO來set另外一個變數接欄位變數
4. 應該要判斷出一行，但現在的邏輯取得第四個欄位都是一樣的，就這樣過吧
5. 變數子字串用法。但不知道能不能從指定位置取到最後。

20170814 Web
抓很多圖示檔，原本想用Excel來對應每一個資料夾內的大致圖檔風格，但想要像ACDsee的看圖軟體，
所以試試看如果用網頁來寫可以寫到甚麼程度。

20170815 Web
找到一個FastStone可以取代ACDsee，只是資料夾要一個個開的話也是有點麻煩，
那麼把方向改為，search png將結果寫入txt，網頁來讀取這些圖檔來呈現

20200710 Git
GitPractice_A／B同時從master切出來，但GitPractice_A已經先修改了後，並且PUSH、合併進master。
接下來GitPractice_B同樣編輯相同位置不同文字，來解衝突
（備註一下，Typora編輯上，直接按enter換行段落較高、按shift+enter換行段落較低）
GitPractice_B同位置也加一行自己的