'''Примеры объявления строк'''

s1 = "Двойные"
s2 = 'Одинарные'
s3 = """Много
Стро
Чные"""
s4 = '''Так
Тоже
Можно'''

s5 = str() # ''
s6 = str("Hello!") # 'Hello!'
s7 = str('I love python!') # 'I love python!'

# F-strings (C-type, only after 3.6)

s8 = f'Hello, {s7}' # 'Hello, I love python!'
s9 = f'12+5={12+5}' # '12+5=17'

s10 = f'\\\'\"' # \'"

s11 = b'\x00'
print(int.from_bytes(s11)) # 0

s12 = b'\x10'
print(int.from_bytes(s12)) # 16

s13 = b'\xff'
print(int.from_bytes(s13)) # 255

s14 = b'\x10\x00'
print(int.from_bytes(s14, byteorder="little")) # 16

s15 = b'\x10\x00'
print(int.from_bytes(s15, byteorder="big")) # 4096

s16 = '\\' # Только так!

s17 = r"Hello\I\Love\C" # Hello\I\Love\C

s18 = b"ASCII bytes only" # b'ASCII bytes only'

print(int.from_bytes(s11+s12)) # 16
print(int.from_bytes(s12+s11)) # 4096 (Умножение байт)

#print(int.from_bytes(s11*s12)) #НЕЛЬЗЯ умножать байтовые объекты (Перевести в int)

print(s11*2) # b'\x00\x00'
print(int.from_bytes(s12*2)) # 4112
print(int.from_bytes(2*s12)) # 4112

print(len(s11+s12)) #2, hex-числа в формате \xNN - одно число (Как 1, 10, 100...)

print(s12[0]) # 16

s19 = b'\x00\x00\x00\x01'
print(int.from_bytes(s19)) # 1

print(s19[2:4]) # \x00\x01
print(int.from_bytes(s19[2:4])) # 1
print(b'\x03' in s19) # False

s20 = b'\x00\x01\x00\x02'
print(s20[1::2]) # b'\x01\x02'
print(int.from_bytes(s20[1::2])) # 258

s21 = 'I love my job!'
print(s21.find('live')) # -1
print(s21.find('love')) # 2
print(s21.rfind('boj')) # -1
print(s21.rfind('job')) # 10
#print(s21.index('live')) # ERR: not found
print(s21.index('love')) # 2
print(s21.count('live')) # 0
print(s21.count('love')) # 1
print(s21.replace('love', 'hate')) # I hate my job!
s22 = 'IIIIIII'
print(s22.replace('i'.upper(), 'X', 1)) # XIIIIII
print(s22.replace('I'.lower(), 'X', 1)) # IIIIIII
print('привет'.encode('utf-8')) # \xd0\xbf\xd1\x80\xd0\xb8\xd0\xb2\xd0\xb5\xd1\x82

s23 = b'\x00\x2c\x02\x2c\x02'
s24 = b'\x2c'
print(s24.decode('ASCII'))
print(s23.split(b'\xc2'))
print(s23.split(b','))

print(s24.center(15, b'\x2d'))
print(s24.rjust(15, b'0')) 
#print(s24.rjust(15, b'01')) НЕЛЬЗЯ - символ 01 запишется как: \x00\x01, нужен байтовый объект занимающий 1 ячейку
#print(s24.rjust(15, b'Я')) НЕЛЬЗЯ - только ASCII символы

s25 = b'\x20\x20\x20\x48\x65\x6c\x6c\x6f\x20\x20\x20'
print(s25.strip(' '.encode('ASCII'))) # Hello
print(s25.strip(b' ')) # Hello
print(s25.rstrip(b' ')) # ___Hello

s26 = b'\x48\x65\x6c\x6c\x6f'
print(s26.removeprefix(b'He')) # llo

print('привет'.encode('utf-8')) # \xd0\xbf\xd1\x80\xd0\xb8\xd0\xb2\xd0\xb5\xd1\x82 кириллица занимает 2 байта в utf. В ASCII нельзя перевести.

# table = str.maketrans('hell', 'ja]') НЕЛЬЗЯ - одинаковое число символов.
table = str.maketrans('Hel', 'Leh')
table_bytes = bytearray(range(256))
# Replace specific byte values
table_bytes[ord('H')] = ord('L')
table_bytes[ord('e')] = ord('e')
table_bytes[ord('l')] = ord('h')
table_bytes = bytes(table_bytes)
table_bytes_light = bytes.maketrans(b'Hel', b'Leh')
#print(b'\x48\x65\x6c\x6c\x6f'.translate(table)) # НЕЛЬЗЯ - нужна строка
print(b'\x48\x65\x6c\x6c\x6f'.translate(table_bytes_light))
print('Hello'.translate(table)) # Lehho

print(bytes.fromhex('012101')) # \x01!\x01, ! = \x21
print(bytes.hex(b'\x01!\x02')) # Полезно при битой кодировке (Часто в заголовках пакетов при неправильной трансляции), с дальнейшим применением:
s27 = b'!/\x02\x03'
byting = bytearray(s27)
hex_list = ''.join([f'{b:02x} ' for b in byting])
print(hex_list) # \x21\x2f\x02\x03
print(bytes.fromhex(hex_list.encode('ASCII')))
# Обратная конвертация, работает - но не совсем красиво. Можно сделать с delimitres в виде \x20 (Пробел):
hex_list = b''.join([int.to_bytes(b)+b' ' for b in byting])
hex_list = bytes.hex(hex_list)
print(hex_list.encode('ASCII')) # b'21202f2002200320' - каждый чётный символ 20 - разделитель-пробел.
counter = 0
lst = []

for counter, char in enumerate(hex_list):
    # Пропускаем индексы 2, 3, 6, 7, 10, 11... (это символы '2' и '0' от пробела)
    if counter % 4 >= 2:
        continue
    lst.append(char)

result = "".join(lst)
print(result)