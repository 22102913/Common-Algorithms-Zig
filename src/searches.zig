pub fn LinearSearch(T: type, item: T, arr: []const T) u64 {
    for (0..arr.len) |i| {
        if (arr[i] == item)
            return i;
    }
    unreachable;
}

pub fn BinarySearch(T: type, item: T, arr: []const T) u64 {
    var lower: u64 = 0;
    var higher: u64 = arr.len;
    var mid: u64 = arr.len / 2;

    while (true) {
        if (lower > higher)
            unreachable;
        if (item == arr[mid]) {
            return mid;
        } else if (item < arr[mid]) {
            higher = mid - 1;
        } else if (item > arr[mid]) {
            lower = mid + 1;
        }
        mid = (higher - lower) / 2 + lower;
    }
}
