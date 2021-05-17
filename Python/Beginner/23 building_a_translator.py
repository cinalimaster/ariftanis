"""
Giraffe Language
vowels -> g #vovel sesli harf dedek her sesli harfi g harfine dönüştüren yeni bir dil olduğunu varsay
----------------

dog -> dgg
cat -> cgt
"""

def translate(phrase): #fonksiyonu tanımladık burada for loop ile if statement ile birlikte kullanıyoruz
    translation = "" #translation adında içi boş bir değişken tanımladık
    for letter in phrase: #phrase içindeki tüm harfler için
        if letter in "AEIOUaeiou": #sesli harf olup olmadığını kontrol et
            translation = translation + "g" #şartı sağlayan harflerin tamamını g ile değiştir
        else:
            translation = translation + letter # şartı sağlamayanları değiştirme
    return translation

print(translate(input("Enter a phrase: "))) #tanımladığımız translate fonksiyonunu çağırıp yazdığımız kelimenin bu fonksiyonda işlenmesini istiyoruz

"""----BETTER VERSION ----------

def translate(phrase): #fonksiyonu tanımladık burada for loop ile if statement ile birlikte kullanıyoruz
    translation = "" #translation adında içi boş bir değişken tanımladık
    for letter in phrase: #phrase içindeki tüm harfler için
        if letter.lower() in "aeiou":        #sesli harf küçükse
            if letter.isupper():             #sesli harf büyükse
                translation = translation + "G"
            else:
                translation = translation + "g" #şartı sağlayan harflerin tamamını g ile değiştir
        else:
            translation = translation + letter # şartı sağlamayanları değiştirme
    return translation

print(translate(input("Enter a phrase: ")))


----"""