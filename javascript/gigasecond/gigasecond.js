var Gigasecond = function(startDate) {
  this.startDate = startDate;
}

Gigasecond.prototype.date = function() {
  var startTime = this.startDate.getTime();
  var endDate = new Date(startTime + Math.pow(10, 12));

  return endDate;
}

module.exports = Gigasecond;

