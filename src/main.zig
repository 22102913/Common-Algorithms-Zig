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

test "BinarySearch" {
    const arr = [_]u8{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    const item: u8 = 12;
    const result = searches.BinarySearch(u8, item, &arr);
    try std.testing.expect(result == 12);

    const arr1 = [_]u8{ 2, 4, 5, 7, 8, 9, 12, 34, 58, 63, 84, 92, 120 };
    const item1: u8 = 84;
    const result1 = searches.BinarySearch(u8, item1, &arr1);
    try std.testing.expect(result1 == 10);
}
