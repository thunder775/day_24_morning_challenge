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
  int count = 0;
  String stringNumber = number.toString();
  List integers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  for (int j = 0; j < integers.length; j++) {
    for (int i = 0; i < stringNumber.length; i++) {
      if (integers[j] == int.parse(stringNumber[i])) {
        print(stringNumber);
        count++;
        print('integer value ${integers[j]}');
        print(count);
      }
    }
  }
  return count == 10;
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
  print('$rec1 ------- $rec2');
  int length = (rec1[0][1]>=rec2[0][1]?rec2[0][1]:rec1[0][1])-(rec1[0][0]>=rec2[0][0]?rec1[0][0]:rec2[0][0]);
  int height = (rec1[1][1]>=rec2[1][1]?rec2[1][1]:rec1[1][1])-(rec1[1][0]>=rec2[1][0]?rec1[1][0]:rec2[1][0]);
  if(length<0&&height<0) {return 0;}
  print(length);
  print(height);
  return (length*height).abs();
}

List extractor(List<Map<String, int>> rect2) {
  List rect = [];
  List temp = [];
  temp.add(rect2[0]['x']);
  temp.add(rect2[1]['x']);
  temp.sort();
  rect.add(temp);
  temp = [];
  temp.add(rect2[0]['y']);
  temp.add(rect2[1]['y']);
  rect.add(temp);
  temp.sort();
  return rect;
}

main() {
//  print(isPandigital(1023456789));
  overlappingRectangles([
    {'x': 1, 'y': 0},
    {'x': 3, 'y': 3}
  ], [
    {'x': 2, 'y': 1},
    {'x': 3, 'y': 2}
  ]);
}
