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
            return .{
                .top = undefined,
                .size = 0,
                .allocator = allocator,
            };
        }

        pub fn deinit(self: *Stack(T)) void {
            while (self.size > 0) : (self.size -= 1) {
                const below = self.top.below;
                self.allocator.destroy(self.top);
                self.top = below;
            }
        }

        pub fn push(self: *Stack(T), data: T) !void {
            const newNode = node{
                .below = self.top,
                .data = data,
            };

            const newTop = try self.allocator.create(@TypeOf(newNode));
            newTop.* = newNode;
            self.top = newTop;
            self.size += 1;
        }

        pub fn pop(self: *Stack(T)) T {
            const top = self.top.*;
            self.allocator.destroy(self.top);
            self.top = top.below;
            self.size -= 1;
            return top.data;
        }
    };
    return stack;
}
