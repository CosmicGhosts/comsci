
function filterPeaks (points) {
  var length = points.length
  var peaks = []

  for (var i = 1; i < length - 1; i++) {
    if (points[i] > points[i-1] && points[i] > points[i+1]) {
      peaks.push(i)
    }
  }

  return peaks
}

function findPartitions (peaks, pointsLength) {
  var count = 0

  for (var size = 1; size < pointsLength; size++) {
    if (pointsLength % size !== 0) { continue }
    var partitions = 0
    var partitionBy = pointsLength / size

    peaks.forEach(function (peak) {
      var partition = Math.floor(peak / partitionBy)
      if (partition === partitions) {
        partitions += 1
      }
    })

    if (partitions === size) { count = size }
  }

  return count
}

function mountains (points) {
  var length = points.length
  var peaks = filterPeaks(points)
  var partitions = findPartitions(peaks, length)
  return partitions
}

(function main () {
  var array = [1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]
  return console.log(mountains(array))
})()
