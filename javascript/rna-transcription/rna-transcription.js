function DnaTranscriber() {}

DnaTranscriber.prototype.toRna = function(str) {
  DNA_TO_RNA = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
  };
  return str
    .split('')
    .map(function(e) {
      return DNA_TO_RNA[e];
    }).join('');
}

module.exports = DnaTranscriber;
