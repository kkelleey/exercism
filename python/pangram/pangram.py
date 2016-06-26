from string import ascii_lowercase

def is_pangram(string):
    return all(letter in string.lower() for letter in ascii_lowercase)
