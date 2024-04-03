pub fn LinearSearch(T: type, item: T, arr: []const T) u64 {
    // Loop through each item in the array
    for (0..arr.len) |i| {
        // Check if array item is same as target item
        if (arr[i] == item)
            // Return index of item
            return i;
    }
    // If the item was not found
    unreachable;
}

pub fn BinarySearch(T: type, item: T, arr: []const T) u64 {
    var lower: u64 = 0;
    var higher: u64 = arr.len;
    var mid: u64 = arr.len / 2;

    while (true) {
        if (lower > higher)
            unreachable;
        // Check where target item is relative to array
        if (item == arr[mid]) {
            // Return index of item (midpoint)
            return mid;
        } else if (item < arr[mid]) {
            // Only target left half of the array
            higher = mid - 1;
        } else if (item > arr[mid]) {
            // Only target right half of the array
            lower = mid + 1;
        }
        // Set new midpoint
        mid = (higher - lower) / 2 + lower;
    }
}
