pub fn BubbleSort(T: type, arr: []T) void {
    var sorted: bool = false;
    while (!sorted) {
        sorted = true;
        for (0..arr.len - 1) |i| {
            if (arr[i] > arr[i + 1]) {
                const temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                sorted = false;
            }
        }
    }
}

pub fn InsertionSort(T: type, arr: []T) void {
    for (1..arr.len) |i| {
        var j: u64 = i;
        while (j > 0) : (j -= 1) {
            if (arr[j] >= arr[j - 1]) {
                break;
            }
            //swap
            const temp = arr[j];
            arr[j] = arr[j - 1];
            arr[j - 1] = temp;
        }
    }
}
