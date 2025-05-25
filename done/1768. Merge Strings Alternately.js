/**
 * @param {string} word1
 * @param {string} word2
 * @return {string}
 */
var mergeAlternately = function (word1, word2) {
  let length = word1.length > word2.length ? word2.length : word1.length;
  let result = "";
  for (let i = 0; i < length; i++) {
    result = result + word1.at(i) + word2.at(i);
  }
  if (word1.length === word2.length) {
    return result;
  }
  if (word1.length > word2.length) {
    result = result + word1.substring(length);
  } else {
    result = result + word2.substring(length);
  }
  return result;
};
console.log(mergeAlternately("abc", "dfgzzzz"));
