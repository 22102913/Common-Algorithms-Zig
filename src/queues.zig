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
            return .{
                .front = undefined,
                .back = undefined,
                .size = 0,
                .allocator = allocator,
            };
        }

        pub fn deinit(self: *Queue(T)) void {
            var empty = false;
            while (empty) {
                if (self.front == self.back)
                    empty = true;

                const newFront = self.front;
                self.allocator.destroy(self.front);
                self.front = newFront;
            }
            self.size = 0;
        }

        pub fn enQueue(self: *Queue(T), data: T) !void {
            const newNode = node{
                .next = undefined,
                .data = data,
            };
            const newBack = try self.allocator.create(@TypeOf(newNode));
            if (self.size == 0) {
                self.front = newBack;
                self.back = newBack;
            } else {
                self.back.next = newBack;
            }
            newBack.* = newNode;
            self.back = newBack;
            self.size += 1;
        }

        pub fn deQueue(self: *Queue(T)) T {
            const data = self.front.data;
            const newFront = self.front.next;
            self.allocator.destroy(self.front);
            self.front = newFront;
            self.size -= 1;
            return data;
        }
    };
    return queue;
}
