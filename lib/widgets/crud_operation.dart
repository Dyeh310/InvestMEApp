import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDOperation{
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  String name, category, note, date;
  double amount;

  void createData() async {
    _firestore.collection('previous_expenditures').add({
      'name': name,
      'note': note,
      'category': category,
      'amount': amount, 
      'date': date,
    });
  }

  // To get data for Previous Expenditure - will not manually sync until reload
  // Change reference name to access a new Firestore Document
  void getData() async {
    final expenditures = await _firestore.collection('previous_expenditures').getDocuments();
    for (var expenditure in expenditures.documents){
      print(expenditure.data);
    }
  }
  
  // subscribes to previous expenditures data on Firestore
  void getDataStream() async{
    await for(var snapshot in _firestore.collection('previous_expenditures').snapshots()){
      for (var expenditure in snapshot.documents){
      print(expenditure.data);
      }
    }
  }
}
