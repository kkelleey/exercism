//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype.hey = function(input) {
  switch(true) {
    case input.toUpperCase() == input && /[A-Z]/.test(input):
      return 'Whoa, chill out!'
    case /\?$/.test(input):
      return 'Sure.';
    case /^\s*$/.test(input):
      return 'Fine. Be that way!';
    default:
      return 'Whatever.'
  }
};

module.exports = Bob;
