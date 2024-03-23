const std = @import("std");
const searches = @import("searches.zig");

pub fn main() !void {
    std.debug.print("HELLO WORLD!\n", .{});
}

test "linearSearch" {
    const arr = [_]u8{ 7, 3, 8, 9, 3, 2, 4, 76, 2, 5, 7, 62, 35, 61, 21, 5 };
    const item: u8 = 5;
    const result = searches.LinearSearch(u8, item, &arr);
    try std.testing.expect(result == 9);
}