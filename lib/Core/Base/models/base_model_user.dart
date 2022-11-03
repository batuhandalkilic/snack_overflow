// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'base_model_user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  String? adress;
  @HiveField(4)
  String? contact;
  @HiveField(5)
  List<String>? recentSearches;
  @HiveField(6)
  String? crediCart;
  @HiveField(7)
  bool isOnboarding;

  User({
    required this.id,
    required this.email,
    required this.password,
    this.adress,
    this.contact,
    this.recentSearches,
    this.crediCart,
    this.isOnboarding = true,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? adress,
    String? contact,
    List<String>? recentSearches,
    String? crediCart,
    bool? isOnboarding,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      adress: adress ?? this.adress,
      contact: contact ?? this.contact,
      recentSearches: recentSearches ?? this.recentSearches,
      crediCart: crediCart ?? this.crediCart,
      isOnboarding: isOnboarding ?? this.isOnboarding,
    );
  }
}
