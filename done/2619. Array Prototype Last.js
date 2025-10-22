/**
 * @return {null|boolean|number|string|Array|Object}
 */
Array.prototype.last = function() {
  let size = this.length;
  if (size === 0) {
    return -1;
  } else {
    return this[size - 1];
  }
};

/**
 * const arr = [1, 2, 3];
 * arr.last(); // 3
 */