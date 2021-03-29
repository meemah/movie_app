import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/networking/api_serivce.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  test('Constructing Service should find correct dependencies', () {
    var apiService = ApiClient().get();
    expect(apiService != null, true);
  });
}
