# csv file link https://github.com/amankharwal/Website-data/blob/master/bank.csv?raw=true
# import libraries and load datafile
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

data = pd.read_csv("bank.csv")
data.head()

# check correlation
import matplotlib.pyplot as plt
import seaborn as sns
sns.set()
sns.heatmap(data.corr())
plt.show()

# drop bankrupt column
X = data.drop(["Bankrupt?"], axis="columns")
y = data["Bankrupt?"]

# logistic regression split data 
x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
logreg = LogisticRegression()
logreg.fit(x_train, y_train)

# run model
LogisticRegression(C=1.0, class_weight=None, dual=False, fit_intercept=True,
                   intercept_scaling=1, l1_ratio=None, max_iter=100,
                   multi_class='auto', n_jobs=None, penalty='l2',
                   random_state=None, solver='lbfgs', tol=0.0001, verbose=0,
                   warm_start=False)

# check accuracy score
logreg.score(x_test, y_test)

"""
0.9596774193548387
"""


""" usefull indicator names used in database and their turkish translations here below

  ROA(C) before interest and depreciation before interest	Faiz ve amortisman öncesi ROA(C) 
  ROA(A) before interest and % after tax	Faiz ve vergi öncesi% ROA(A) 
  ROA(B) before interest and depreciation after tax	Faiz ve amortisman öncesi, vergi sonrası ROA(B) 
  Operating Gross Margin	Faaliyet Brüt Marjı
  Realized Sales Gross Margin	Gerçekleşen Brüt Satış Marjı
  Operating Profit Rate	Faaliyet Kar oranı
  Pre-tax net Interest Rate	Vergi öncesi net faiz oranı
  After-tax net Interest Rate	Vergi sonrası net faiz oranı
  Non-industry income and expenditure/revenue	Sanayi dışı gelir ve gider/gelir
  Continuous interest rate (after tax)	Vergi sonrası devam eden faiz oranı
  Operating Expense Rate	İşletme gider oranı
  Research and development expense rate	AR-Ge gider oranı
  Cash flow rate	Nakit akış oranı
  Interest-bearing debt interest rate	Faize tabi borçların faiz oranı
  Tax rate (A)	Vergi oranı
  Net Value Per Share (B)	hisse başına net değer B
  Net Value Per Share (A)	hisse başına net değer A
  Net Value Per Share (C)	hisse başına net değer C
  Persistent EPS in the Last Four Seasons	Son 4 mevsim için kalıcı Hisse başına kazanç
  Cash Flow Per Share	hisse başına düşen nakit akışı
  Revenue Per Share (Yuan ¥)	hisse başına düşen gelir (yuan)
  Operating Profit Per Share (Yuan ¥)	hisse başına düşen faaliyet karı (yuan)
  Per Share Net profit before tax (Yuan ¥)	vergi öncesi hisse başına düşen net kar (yuan)
  Realized Sales Gross Profit Growth Rate	gerçekleşen Brüt Satış Marjı büyüme oranı
  Operating Profit Growth Rate	faaliyet karı büyüme oranı
  After-tax Net Profit Growth Rate	vergi sonrası net kar büyüme oranı
  Regular Net Profit Growth Rate	düzenli net kar büyüme oranı
  Continuous Net Profit Growth Rate	sürekli net kar büyüme oranı
  Total Asset Growth Rate	toplam varlık büyüme oranı
  Net Value Growth Rate	net değer büyüme oranı
  Total Asset Return Growth Rate Ratio	toplam aktif getiri artış oranı
  Cash Reinvestment %	nakit yeniden yatırım yüzdesi
  Current Ratio	likidite oranı (bir yıldan kısa süreli borçları ödeme gücü)
  Quick Ratio	nakit türevleri + hisse + alacakların /1 yıllık kısa vadeli borçlara oranı
  Interest Expense Ratio	faiz maliyet oranı
  Total debt/Total net worth	toplam borç / toplam net değer
  Debt ratio %	borç yüzdesi oranı
  Net worth/Assets	net değer / varlıklar
  Long-term fund suitability ratio (A)	Uzun vadeli fon uygunluk oranı (A)
  Borrowing dependency	 Borçlanma bağımlılığı
  Contingent liabilities/Net worth	 Koşullu yükümlülükler/Net değer
  Operating profit/Paid-in capital	  Faaliyet karı/Ödenmiş sermaye
  Net profit before tax/Paid-in capital	 Vergi öncesi net kar/Ödenmiş sermaye
  Inventory and accounts receivable/Net value	 Envanter ve alacak hesapları/Net değer
  Total Asset Turnover	 Toplam Aktif Devir
  Accounts Receivable Turnover	  Alacak hesap cirosu
  Average Collection Days	 Ortalama Toplama Günleri
  Inventory Turnover Rate (times)	 Envanter Devir Hızı (kez)
  Fixed Assets Turnover Frequency	 Duran Varlık Devir Sıklığı
  Net Worth Turnover Rate (times)	  Net Değer Devir Oranı (kez)
  Revenue per person	 Kişi başı gelir
  Operating profit per person	 Kişi başı faaliyet karı
  Allocation rate per person	 Kişi başı tahsis oranı
  Working Capital to Total Assets	 İşletme Sermayesi Toplam Varlıklar
  Quick Assets/Total Assets	 Hızlı Varlıklar/Toplam Varlıklar
  Current Assets/Total Assets	 Dönen Varlıklar/Toplam Varlıklar
  Cash/Total Assets	 Nakit/Toplam Varlıklar
  Quick Assets/Current Liability	 Hızlı Varlıklar/Cari Yükümlülük
  Cash/Current Liability	 Nakit/Cari Yükümlülük
  Current Liability to Assets	 Varlıklara Karşı Mevcut Sorumluluk
  Operating Funds to Liability	 Sorumluluk Fonlarını Çalıştırmak
  Inventory/Working Capital	 Envanter/İşletme Sermayesi
  Inventory/Current Liability	 Envanter/Cari Sorumluluk
  Current Liabilities/Liability	 Mevcut Yükümlülükler/Yükümlülük
  Working Capital/Equity	 İşletme Sermayesi/Özkaynak
  Current Liabilities/Equity	 Mevcut Yükümlülükler/Özkaynak
  Long-term Liability to Current Assets	 Dönen Varlıklara Uzun Vadeli Sorumluluk
  Retained Earnings to Total Assets	 Geçmiş Yıllar Kârı Toplam Varlıklara
  Total income/Total expense	 Toplam gelir/Toplam gider
  Total expense/Assets	 Toplam gider/Varlıklar
  Current Asset Turnover Rate	 Cari Varlık Devir Hızı
  Quick Asset Turnover Rate	 Hızlı Varlık Devir Hızı
  Working capitcal Turnover Rate	 Çalışan Sermaye Devir Hızı
  Cash Turnover Rate	 Nakit Devir Hızı
  Cash Flow to Sales	 Satışlara Nakit Akışı
  Fixed Assets to Assets	 Duran Varlıklardan Varlıklara
  Current Liability to Liability	 Mevcut Sorumluluk Sorumluluğu
  Current Liability to Equity	 Mevcut Özkaynak Yükümlülüğü
  Equity to Long-term Liability	 Özkaynaktan Uzun Vadeli Sorumluluğa
  Cash Flow to Total Assets	  Toplam Aktiflere Nakit Akışı
  Cash Flow to Liability	 Yükümlülüğe Nakit Akışı
  CFO to Assets	 CFOdan Varlıklara
  Cash Flow to Equity	 Özkaynaklara Nakit Akışı
  Current Liability to Current Assets	 Dönen Varlıklara Cari Yükümlülük
  Liability-Assets Flag	 Yükümlülük-Varlık Bayrağı
  Net Income to Total Assets	 Net Gelirden Aktif Toplamına
  Total assets to GNP price	 Toplam varlıkların GSMH fiyatına oranı
  No-credit Interval	 Kredisiz Aralık
  Gross Profit to Sales	 Satışlara Brüt Kar
 " Net Income to Stockholders Equity"	 "Öz Sermaye Net Gelir"
  Liability to Equity	 Özkaynak Sorumluluğu
  Degree of Financial Leverage (DFL)	 Finansal Kaldıraç Derecesi (DFL)
  Interest Coverage Ratio (Interest expense to EBIT)	  Faiz Karşılama Oranı (Faiz giderinin FVÖKe oranı)
  Net Income Flag	 Net Gelir Bayrağı
  Equity to Liability	 Sorumluluk Eşitliği


"""
