// Challenge 1
// Write test cases for the given challenges

// Challenge 2
// Pandigital Numbers
// A pandigital number contains all digits (0-9) at least once. Write a function
// that takes an integer, returning true if the integer is pandigital, and false otherwise.
//  Examples
//  isPandigital(98140723568910) ➞ true

import 'dart:math';

bool isPandigital(int number) {
List listOfIntegers =  number.toString().split('');
return listOfIntegers.toSet().length==10;
}

// Challenge 3
// Area of Overlapping Rectangles
// Create a function that returns the area of the overlap between two rectangles.
// The function will receive two rectangles, each with the coordinates of two of
// its opposite angles.
//
// Examples
// overlappingRectangles(
//    [{ x: 2, y: 1 }, { x: 5, y: 5 }],
//    [{ x: 3, y: 2 }, { x: 5, y: 7 }]
//  ) ➞ 6
int overlappingRectangles(
    List<Map<String, int>> rect1, List<Map<String, int>> rect2) {
  List rec1 = extractor(rect1);
  List rec2 = extractor(rect2);
  List overlap = getOverlappingDimensions(rec1, rec2);
  if (overlap[0] < 0 || overlap[1] < 0) {
    return 0;
  }
  return (overlap[0] * overlap[1]).abs();
}

List getOverlappingDimensions(List rect1, List rect2) {
  List r1x = rect1[0];
  List r2x = rect2[0];
  int leftX = max(r1x[0], r2x[0]);
  int rightX = min(r1x[1], r2x[1]);
  List r1y = rect1[1];
  List r2y = rect2[1];
  int topY = min(r1y[1], r2y[1]);
  int bottomY = max(r1y[0], r2y[0]);

  return [(rightX - leftX), (topY - bottomY)];
}



List extractor(List<Map<String, int>> rectangle) {
  List<List> rect = [];
  rect.add(rectangle.map((Map coord) => coord['x']).toList());
  rect.add(rectangle.map((Map coord) => coord['y']).toList());
  for (List x in rect) {
    x.sort;
  }
  return rect;
}

main() {
  print(isPandigital(1023456789));
  print(overlappingRectangles([
    {'x': 1, 'y': 0},
    {'x': 3, 'y': 3}
  ], [
    {'x': 2, 'y': 1},
    {'x': 3, 'y': 2}
  ]));
}
