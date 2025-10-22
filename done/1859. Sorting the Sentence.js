/**
 * @param {string} s
 * @return {string}
 */
var sortSentence = function (s) {
  let arr = s.split(' ');
  let map = new Map();
  for (const element of arr) {
    let lastDigit = element.length;
    for (let i = element.length - 1; i >= 0; i--) {
      const item = element[i];
      if (element.charCodeAt(i) > 57) {
        break;
      }
      lastDigit = i;
    }
    map.set(Number(element.substring(lastDigit)), element.substring(0, lastDigit));
  }
  let sortedMap = Array.from(map).sort((a, b) => a[0] - b[0]);
  return sortedMap.map(item => item[1]).join(' ');
};