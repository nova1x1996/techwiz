import 'dart:convert';

class Account{
  String id;
  String fullName;
  String email;
  String phone;
  bool gender;
  String? avatar;
  String dob;
  String address;
  String accountId;
  bool isDeleted;
  Account({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.avatar,
    required this.dob,
    required this.address,
    required this.accountId,
    required this.isDeleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'avatar': avatar,
      'dob': dob,
      'address': address,
      'accountId': accountId,
      'isDeleted': isDeleted,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      gender: map['gender'] as bool,
      avatar: (map['avatar'] == null) ? null : map['avatar']as String,
      dob: map['dob'] as String,
      address: map['address'] as String,
      accountId: map['accountId'] as String,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source) as Map<String, dynamic>);
}