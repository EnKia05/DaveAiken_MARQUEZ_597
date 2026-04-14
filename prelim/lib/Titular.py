class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        
        self.items.append(item)
        print(f"Stack: {self.items}")

    def pop(self):
        if not self.is_empty():
            popped_item = self.items.pop()
            print(f"Popped: {popped_item}")
            print(f"Stack after pop: {self.items}")
            return popped_item
        else:
            print("Stack is empty, cannot pop.")
            return None

    def peek(self):
        if not self.is_empty():
            return self.items[-1]
        else:
            return None

    def is_empty(self):
       
        return len(self.items) == 0

    def size(self):
        
        return len(self.items)
my_stack = Stack()
print("Pushing: 10, 20, 30")
my_stack.push(10)
my_stack.push(20)
my_stack.push(30)

my_stack.pop()
my_stack.pop()