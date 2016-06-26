def is_pangram(string):
    for i in range(97, 97 + 26):
        if not (chr(i) in string.lower()):
            return False
    return True
