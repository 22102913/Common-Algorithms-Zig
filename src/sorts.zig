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
