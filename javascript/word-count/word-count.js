function Words() {};

Words.prototype.count = function(phrase) {
  var result = {};
  words = phrase.trim().toLowerCase().split(/\s+/);
  words.forEach(function(word) {
    if (isNaN(result[word])) { result[word] = 0 }
    result[word]++;
  });
  return result;
}

module.exports = Words;
