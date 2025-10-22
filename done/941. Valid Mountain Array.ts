function validMountainArray(arr: number[]): boolean {
    if (arr.length < 3) return false;
    let increasing: boolean = true;
    for (let i = 1; i < arr.length; i++) {
        if (increasing)  {
            if (arr[i] > arr[i - 1]) continue;
            else if (arr[i] < arr[i - 1] && i > 1) increasing = false;
            else return false;
        } else {
            if (arr[i] < arr[i - 1]) continue;
            else return false;
        }
    }
    return true && !increasing;
};