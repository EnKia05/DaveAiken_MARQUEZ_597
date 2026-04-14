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
    # Normalize: ignore non-alphanumeric chars and case
    normalized = ''.join(ch.lower() for ch in word if ch.isalnum())
    s = Stack()
    for ch in normalized:
        s.push(ch)

    reversed_word = []
    while not s.is_empty():
        reversed_word.append(s.pop())

    return normalized == ''.join(reversed_word)

# Sample output:
def main():
    try:
        # Prompt twice to preserve original behavior, but handle EOF
        for i in range(2):
            word = input("Enter a word: ")
            if is_palindrome_with_stack(word):
                print(f"'{word}' is a palindrome.")
            else:
                print(f"'{word}' is not a palindrome.")
    except EOFError:
        pass

if __name__ == '__main__':
    main()