def is_palindrome_stack(word):
    stack = []
    for char in word:
        stack.append(char)
    reversed_word = ""
    while stack:
        reversed_word += stack.pop()
    return word == reversed_word


word = input("Enter a word: ")
if is_palindrome_stack(word):
    print(f"'{word}' is a palindrome.")
else:
    print(f"'{word}' is not a palindrome.")