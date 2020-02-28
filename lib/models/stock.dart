import 'dart:math';
import 'package:random_string/random_string.dart';

class Stock {
  String name;
  int currentPrice;

  Stock();

  setName() {
    String newName = randomAlpha(4).toUpperCase();
    this.name = newName;
  }

  setAmount() {
    var rng = new Random();
    int r;
    r = 1 +rng.nextInt(200 - 1);
    this.currentPrice = r;
  }

  getName() {
    return this.name;
  }

  getCurrentPrice() {

    return '+' + this.currentPrice.toString();
  }

  toString(){
    return 'Name: ' + getName() + ' Price: ' + getCurrentPrice();
  }

}