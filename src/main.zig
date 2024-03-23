const std = @import("std");

pub fn main() !void {
    std.debug.print("HELLO WORLD!\n", .{});
}

test "test1" {
    std.debug.print("TEST1\n", .{});
}
