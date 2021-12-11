class UserModel{

  late String firstName;
  late String lastName;
  late String phoneNumber;
  late int qsAnswered;
  late int qsCorrect;

  UserModel(this.firstName, this.lastName, this.phoneNumber, this.qsAnswered, this.qsCorrect);

Map<String, dynamic> toMap(){
  Map<String, dynamic> temp = new Map();
  temp.putIfAbsent('firstName', () => firstName);
  temp.putIfAbsent('lastName', () => lastName);
  temp.putIfAbsent('phoneNumber', () => phoneNumber);
  temp.putIfAbsent('Answered', () => qsAnswered);
  temp.putIfAbsent('Correct', () => qsCorrect);
  return temp;
}
}