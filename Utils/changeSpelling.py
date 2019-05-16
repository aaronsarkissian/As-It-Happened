import os, re

#The RegExp that used to catch and change the spelling of the words
# USSR = r"[Uu]\.?([Ss]\.?){2}[Rr]\.?"
# US = r"(?<=\s)[U]\.?[Ss]\.?\b\.?(?=\s)"
# KHOJALI = r"[Kk][Hh][Oo][Dd]?[JjGgZz][Hh]?[Aa][Ll][Oo]?[IiYyUu]"

directory = os.listdir('Path/to/the/directory')
os.chdir('Path/to/the/directory')
regex = r"[Uu]\.?([Ss]\.?){2}[Rr]\.?" #Replace this line with the one you want
count  = 1

for file in directory:
    open_file = open(file, 'r', encoding="windows-1252") #There are characters that need this encoding
    read_file = open_file.read()
    regRes = re.compile(regex)
    read_file_res = regRes.sub('USSR', read_file)
    write_file = open(file, 'w')
    write_file.write(read_file_res)
    count += 1

print("Number of files: ", count)
