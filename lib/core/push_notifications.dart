import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

class PushNotifications {
  static Future<String> getAccesTpken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "e-com-d6781",
      "private_key_id": "b7ef362c7cb6dfd8bec5e6317a8aed90184e92a0",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCi+y/gBH+6p0T4\n2aXFETHK5qfLNfk7EbN75NFHpggVdu7qlm9lKi4re0tgMhK1dItbFUH7qr+Oea9D\ne6BY3z3QWB7EJIEVSLEdJkUA/bCnFunT7bxbfFZ0Q6aTKKF8X0N/3iR6hBLhpL57\nPnKcIefn52Plq4uRrCqXcWD6otFltKpDmLInNhfJr6UOSUtCpcA3WEzGInZJvoD4\nVonPJ1HEYP93YaTvqkRPt78Uu85wuwdDS5bNdtJzaHmZbjQ5nEDhwe9fghe+/7BL\nux1uZZFHjuatlot0zu4N3jukYX4YtCqdzaEnci7vB8Eyh0kCmXiX9JY30vufsxyf\nSlQ/OntHAgMBAAECgf9/ihGXke23zdiA5HvUu0qRJ+7RbGtHeOf7tr65qDQAmBG0\nLK+qJa1RBCr4HDcycwFFRbKyPpb955DqPimSDSCnlE3UhWco62RZFe7p15y7JN3W\npTPBDovub6zq0TY4cv60vCHPvjWzCONcOSzMVxF4ve/EICTC2k0k4JSuOLukhNGk\nM3SUPIiCyvvXTrLw+yXATKyGWe1/YB6Ptxil2emzxzQqH6Jes2YcGsvo0TTAISUL\nE2lQtJTI/Mpm404w/CPrTnGigsOiTMjSaMgU06GzWLltr/vWXCTU9vKE0Oi/LBcS\ngPXkAmmrqhDsvLyCiYPrNvSbEftVicqPRJHzxPECgYEA2nQoccQjMIRqRDop7VWa\nhFdS/N7mTGHnVwDjyJck0L353VDNfMDjj7L0fHAdOnf4IFryv94IW61NKVsdAwEj\nahEmEa8L7wns99kTL5wscCTU9QclvZHvCOb4p/wJ/VTGhFiFhItjbfCPOCyobRPY\nhEsGJxpTVV5b8rj4lobfeB8CgYEAvv5EriOS+Q7B+jb/lPuCY2fBd73ij3n7bw1i\nJ2kP2BCYPQ8opaKiXmKdeEupgVsnj8qsmRkGqbAVClCePQvNLkIxw8fydFe05riw\n9G950M7XN8tmDfYHiHlky0QeTciChE6+6WqvYLX1rVQSaC65QT3xJoGQyfHfvE3A\nUvMhN9kCgYEAqfUtcjWS2zBqLOLDs+6h5My7uBkDO/H/tmTu0yUkc3MabuFqveCk\nKyyjohzn4JFt7l5T9oqcHhdarQ5CKBA+qUrmP2Pc+QDT6JBuqN/sguNk+62v4yki\nu95XHvqsGvhV6qmkV1bK6MH760xzTUnfbi2gf9Ovef+Lse/PF+2e9ykCgYAIk6SD\n6WcNNiNx2AxsJUs6qYsflHBbHxAycXhp6qbifgRIIakinwYJlQYbQ9KN04kYRPKx\nQVVyQ0z+lJY2iZQiMqjHcPArV1DxV3Pi1iqzPMafY8vmbpjyAPmMwzdVKN7rkBm0\no6zSe/lXWkIlWYvKKTzuDL1yxCDW9OrhDrf8KQKBgQDL0nvHZKaqxKbk6tQ+3jrC\n97PyhETPC4tZ2BJQHLmIMHSVMlntKk6Olu/oxLW5FtDbiMs2I23TaHc/THpDL+gW\n+Ku55G8KrXiTzf8PtQoCy9x1VLFZDBdhx2p/v89wemOLYrSrfgsG4KzTYd1/w742\nIh19bEuVpJtvjn8k78BP7g==\n-----END PRIVATE KEY-----\n",
      "client_email": "flutter-ecom-728@e-com-d6781.iam.gserviceaccount.com",
      "client_id": "107015459379007828082",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/flutter-ecom-728%40e-com-d6781.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();

    return credentials.accessToken.data;
  }

  static sendNotificationToSelectedDriver(token) async {
    final String serverAccessToken = await getAccesTpken();
    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/e-com-d6781/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': token,
        'notification': {
          'title': 'New message',
          'body': 'You have a new message from support!',
        },
      },
    };

    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Authorization": "Bearer $serverAccessToken",
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print("Notification sent seccesfully !");
    } else {
      print("Failed Failed : ${response.statusCode}");
    }
  }
}
