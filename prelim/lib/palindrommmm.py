class Stack:
    def __init__(self):
        self.items = []

    def is_empty(self):
        return len(self.items) == 0

    def push(self, item):
        self.items.append(item)

    def pop(self):
        if not self.is_empty():
            return self.items.pop()
        return None

    def peek(self):
        if not self.is_empty():
            return self.items[-1]
        return None

def is_palindrome_with_stack(word):
    s = Stack()
   
    for char in word:
        s.push(char)

    reversed_word = ""
    while not s.is_empty():
        reversed_word += s.pop()

    return word == reversed_word


word1 = input("Enter a word: ")
if is_palindrome_with_stack(word1):
    print(f"'{word1}' is a palindrome.")
else:
    print(f"'{word1}' is not a palindrome.")

word2 = input("Enter a word: ")
if is_palindrome_with_stack(word2):
    print(f"'{word2}' is a palindrome.")
else:
    print(f"'{word2}' is not a palindrome.")