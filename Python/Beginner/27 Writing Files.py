# writing a new file or appending into existing file

employee_file = open("employees.txt", "r")
print(employee_file.read())
employee_file.close()

#yeni biri geldi ve işe girdi listeye eklememiz lazım

employee_file = open("employees.txt", "a") #dosyaya ekleme yapacağız a parametresini giriyoruz
employee_file.write("Toby - Human Resources")#dosyanın sonuna birşey yazmak istiyorum
employee_file.close()#dosyaya yanlışlıkla tekrar yazıp dosyayı bozmamaya dikkat et

employee_file = open("employees.txt", "r") #yazdığımızı kontrol ediyoruz
print(employee_file.read())
employee_file.close()# yazdı ama yeni satırda yazmadı

# daha iyisini yeniden yazmayı deneyelim

employee_file = open("employees.txt", "a") #dosyaya ekleme yapacağız a parametresini giriyoruz
employee_file.write("\nToby - Human Resources")#dosyanın sonuna yeni bir satıra birşey yazmak istiyorum
employee_file.close()

employee_file = open("employees.txt", "r") #yazdığımızı kontrol ediyoruz
print(employee_file.read())
employee_file.close()# düzgün yazdı

# employees1.txt adında yeni bir dosya oluşturuyoruz

employee_file = open("employees1.txt", "w") #yeni dosya açıyoruz w parametresini giriyoruz
employee_file.write("Toby - Human Resources")#dosyanın için e bir birşey yazmak istiyorum
employee_file.close()


# index.html yeni bir web sayfası dosyası oluşturuyoruz

employee_file = open("index.html", "w") #yeni dosya açıyoruz w parametresini giriyoruz
employee_file.write("<html><br><br><br><br><font face=Impact size=12 color=red><center>This is HTML</center></font></html>")#dosyanın içine html yazıp web sayfası istiyorum
employee_file.close()




