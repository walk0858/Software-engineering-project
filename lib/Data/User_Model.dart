class UserModel{
  late String uid;
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late int qsAnswered;
  late int qsCorrect;

  UserModel(this.uid, this.firstName, this.lastName, this.phoneNumber, this.qsAnswered, this.qsCorrect);

  void fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    phoneNumber = json['phoneNumber'] as String;
    qsAnswered = json['qsAnswered'] as int;
    qsCorrect = json['qsCorrect'] as int;
  }

  Map<dynamic, dynamic> toJson() =>
      <dynamic, dynamic>{
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber' : phoneNumber,
        'qsAnswered': qsAnswered,
        'qsCorrect': qsCorrect,

      };

}