// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String email;
  final String password;
  final String adress;
  final String contact;
  final List<String> recentSearches;

  User(
    this.email,
    this.password,
    this.adress,
    this.contact,
    this.recentSearches,
  );
}
