/// ADT for expenditures.
class Expenditure {
  String _name;
  String _note;
  double _amount;
  DateTime _dateTime;

  /// Constructor to create an Expenditure object with
  /// parameters.
  ///
  /// @param: String for name, String for note, and a double for amount.
  /// @return: An expenditure object with user-specified attributes.
  Expenditure(String name, String note, double amount, DateTime date) {
    this._dateTime = date;
    this._name = name;
    this._note = note;
    this._amount = amount;
  }

  setAmount(double amount) {
    this._amount = amount;
  }

  setNote(String note) {
    this._note = note;
  }

  setName(String name) {
    this._name = name;
  }

  getDateTime() {
    return _dateTime;
  }

  getAmount() {
    return _amount;
  }

  getNote() {
    return _note;
  }

  getName() {
    return _name;
  }
}