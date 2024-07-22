import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/utils/formatters/formatter.dart';

class UserModel {
  final String id; // Unique ID for the user, typically assigned by Firestore
  String firstName; // User's first name
  String lastName; // User's last name
  final String username; // User's username, typically unique
  final String email; // User's email address
  String phoneNumber; // User's phone number
  String profilePicture; // URL to the user's profile picture

  // Constructor to initialize all fields
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Getter to return the user's full name
  String get fullName => '$firstName $lastName';

  // Getter to return the formatted phone number using a custom formatter
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  // Static method to split full name into parts (first and last name)
  static List<String> nameParts(String fullName) => fullName.split(" ");

  // Static method to generate a username based on the full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    // Concatenate first and last name in camel case and add a prefix
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Static method to return an empty UserModel instance
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  // Method to convert UserModel instance to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory constructor to create a UserModel instance from a Firestore document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
