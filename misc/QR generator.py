import qrcode as qr

text = f'https://drive.google.com/file/d/13O7fdPmiro1Z2wRYAaPA3X8a_RqN_N63/view?usp=sharing'
img = qr.make(text)
img.save(f'AMPS_doctrine.svg')

#https://pypi.org/project/qrcode/
