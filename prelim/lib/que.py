class Queue:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)
        print(f"Queue: {self.items}")

    def dequeue(self):
        if not self.is_empty():
            dequeued_item = self.items.pop(0) 
            print(f"Dequeued: {dequeued_item}")
            print(f"Queue after dequeue: {self.items}")
            return dequeued_item
        else:
            print("Queue is empty, cannot dequeue.")
            return None

    def peek(self):
        if not self.is_empty():
            return self.items[0]
        else:
            return None

    def is_empty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)

print("\nQueue Implementation (35 pts):")
my_queue = Queue()
print("Enqueuing: A, B, C")
my_queue.enqueue('A')
my_queue.enqueue('B')
my_queue.enqueue('C')

my_queue.dequeue()