import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/models/expenditure.dart';

/*/// Used to populate the list with sample data.
populateExpenditures(int number) {
  List<Expenditure> newList = new List<Expenditure>(30);
  for (int i = 0; i < newList.length; i++){
    newList[i] = new Expenditure();
    newList[i].setNote(i);
    newList[i].setAmount();
    newList[i].setName(i);
  }
  return newList;
}*/

/// Used to populate stocks with sample data
populateStocks(int number) {
  List<Stock> newList = new List<Stock>(number);
  for (int i = 0; i < newList.length; i++) {
    newList[i] = new Stock();
    newList[i].setAmount();
    newList[i].setName();
  }
  return newList;
}



