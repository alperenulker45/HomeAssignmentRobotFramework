import re

def convert_string_to_decimal(s):
    s = re.sub("[^0123456789.]","",s)
    return s