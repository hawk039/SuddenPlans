import 'dart:convert';
import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _contactText = '';

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    // Perform sign up logic here, e.g. calling an API
    _isLoading = false;
    notifyListeners();
  }

  Future<void> handleGetContact(GoogleSignInAccount user) async {
    _contactText = 'Loading contact info...';
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      _contactText = 'People API gave a ${response.statusCode} '
          'response. Check logs for details.';
      log('People API ${response.statusCode} response: ${response.body}');
      notifyListeners();
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    if (namedContact != null) {
      _contactText = 'I see you know $namedContact!';
      notifyListeners();
    } else {
      _contactText = 'No contacts to display.';
      notifyListeners();
    }
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
        (dynamic name) =>
            (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
      notifyListeners();
    }
    return null;
  }

  Future<void> handleSignIn(GoogleSignIn googleSignIn) async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      log(error.toString());
    }
    notifyListeners();
  }

  Future<void> _handleSignOut(GoogleSignIn googleSignIn) =>
      googleSignIn.disconnect();

  Future<AccessToken?> facebookLogIn() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;
      log('Access Token: ${accessToken?.token}');
      return accessToken;
    } else {
      log('Error: ${result.message}');
    }
    notifyListeners();
    return null;
  }

  Future<void> getFacebookUsers() async {
    final userData = await FacebookAuth.instance.getUserData();
    log('User Name: ${userData['name']}');
    log('User Email: ${userData['email']}');
    log('User Picture: ${userData['picture']['data']['url']}');
  }
}
