pub fn LinearSearch(T: type, item: T, arr: []const T) u64 {
    for (0..arr.len) |i| {
        if (arr[i] == item)
            return i;
    }
    unreachable;
}
