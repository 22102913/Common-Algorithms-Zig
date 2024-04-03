const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn Queue(T: type) type {
    const queue = struct {
        front: *node,
        back: *node,
        size: u64,
        allocator: Allocator,

        const node = struct {
            data: T,
            next: *node,
        };

        pub fn init(allocator: Allocator) !Queue(T) {
            // Return default queue
            return .{
                .front = undefined,
                .back = undefined,
                .size = 0,
                .allocator = allocator,
            };
        }

        pub fn deinit(self: *Queue(T)) void {
            if (self.size == 0)
                return;
            var empty = false;
            // Loop until empty
            while (!empty) {
                if (self.front == self.back)
                    empty = true;
                // Store new front as next in queue
                const newFront = self.front.next;
                // Deallocate font
                self.allocator.destroy(self.front);
                // Set front as new front
                self.front = newFront;
            }
            self.size = 0;
        }

        pub fn enQueue(self: *Queue(T), data: T) !void {
            const newNode = node{
                .next = undefined,
                .data = data,
            };
            // Allocate space for new node
            const newBack = try self.allocator.create(@TypeOf(newNode));
            // Check if empty
            if (self.size == 0) {
                self.front = newBack;
                self.back = newBack;
            } else {
                self.back.next = newBack;
            }
            // Copy new node data into space
            newBack.* = newNode;
            // Point back to new back
            self.back = newBack;
            // Increment size
            self.size += 1;
        }

        pub fn deQueue(self: *Queue(T)) T {
            // Store data from front
            const data = self.front.data;
            // Store new front as next in queue
            const newFront = self.front.next;
            // Deallocate front
            self.allocator.destroy(self.front);
            // Set front as new front
            self.front = newFront;
            // Decrement size
            self.size -= 1;
            return data;
        }
    };
    return queue;
}
