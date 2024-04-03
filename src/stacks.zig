const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn Stack(T: type) type {
    const stack = struct {
        top: *node,
        size: u64,
        allocator: Allocator,

        const node = struct {
            data: T,
            below: *node,
        };

        pub fn init(allocator: Allocator) !Stack(T) {
            // Return default stack
            return .{
                .top = undefined,
                .size = 0,
                .allocator = allocator,
            };
        }

        pub fn deinit(self: *Stack(T)) void {
            // Loop though items
            while (self.size > 0) : (self.size -= 1) {
                // Store node below
                const below = self.top.below;
                // Deallocate top node
                self.allocator.destroy(self.top);
                // Set top node to node below
                self.top = below;
            }
        }

        pub fn push(self: *Stack(T), data: T) !void {
            // Create new node
            const newNode = node{
                .below = self.top,
                .data = data,
            };

            // Allocate space for new node
            const newTop = try self.allocator.create(@TypeOf(newNode));
            // Copy new node data to space
            newTop.* = newNode;
            // Point top to new top
            self.top = newTop;
            // Increment size
            self.size += 1;
        }

        pub fn pop(self: *Stack(T)) T {
            // Store top node data
            const top = self.top.*;
            // Deallocate top node data
            self.allocator.destroy(self.top);
            // Set top to the node below
            self.top = top.below;
            // Decrement size
            self.size -= 1;
            // return data that was stored on top of the stack
            return top.data;
        }
    };
    return stack;
}
