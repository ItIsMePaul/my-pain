/**
 * @param {string} s
 * @return {string[]}
 */
var printVertically = function(s) {
    let array = [];
    let counter = 0;
    for (const word of s.split(" ")) {
        counter++;
        if (array.length < word.length) {
         for (let i = array.length; i < word.length; i++) {
            array.push('');
         }   
        }
        console.log(word);
        let temp = word.split("")
        for (let j = 0; j < temp.length; j++) {
            while (array[j].length < counter - 1) {
                array[j] += ' ';
            }
            array[j] += temp[j];
        }
    }
    return array;
};

printVertically("TO BE OR NOT TO BE");