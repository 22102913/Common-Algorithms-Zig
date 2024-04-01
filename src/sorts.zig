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

pub fn QuickSort(T: type, arr: []T) void {
    if (arr.len <= 1)
        return;

    const pivotValue: T = arr[0];
    var lower: u64 = 1;
    var higher: u64 = arr.len - 1;
    var temp: T = undefined;

    while (true) {
        // Move lower mark
        while (lower <= higher and arr[lower] <= pivotValue) {
            lower += 1;
        }

        // Move higher mark
        while (higher >= lower and arr[higher] >= pivotValue) {
            higher -= 1;
        }

        if (lower < higher) {
            // Swap lower ad higher
            temp = arr[lower];
            arr[lower] = arr[higher];
            arr[higher] = temp;
        } else break;
    }

    // Swap pivot with higher
    arr[0] = arr[higher];
    arr[higher] = pivotValue;

    // Sort lower partition
    QuickSort(T, arr[0..higher]);
    // Sort higher partition
    QuickSort(T, arr[higher + 1 .. arr.len]);
}
