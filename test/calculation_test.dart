import 'package:flutter_test/flutter_test.dart';
import 'package:notification/calculation.dart';

void main(){
  Calculation calculation = Calculation();

  test("Testing addition", () {
    expect(calculation.add(5, 3), 2);
  },);
}