function Hamming() {}

Hamming.prototype.compute = function(a, b) {
  if (a.length != b.length) {
    throw 'DNA strands must be of equal length.';
  }
  a = a.split('');
  b = b.split('');
  count = 0;
  for (i = 0; i < a.length; i ++) {
    if (a[i] != b[i]) {
      count += 1;
    }
  };
  return count;
}

module.exports = Hamming;
