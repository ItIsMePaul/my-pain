type JSONValue = null | boolean | number | string | JSONValue[] | { [key: string]: JSONValue };
type Obj = Record<string, JSONValue> | Array<JSONValue>;

function chunk(arr: Obj[], size: number): Obj[][] {
  let result: Obj[][] = [];
  let temp: Obj[] = [];
  for (var i = 0; i < arr.length; i++) {
    temp.push(arr[i]);
    if (temp.length === size || arr.length - 1 === i) {
      result.push(temp);
      temp = [];
    }
  } 
  return result;
};