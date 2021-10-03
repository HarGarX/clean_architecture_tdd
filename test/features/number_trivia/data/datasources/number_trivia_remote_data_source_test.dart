import 'dart:convert';

import 'package:clean_architecture_tdd_course/core/error/exception.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(jsonDecode(fixture('trivia.json')));

    test(
        'should preform a GET request on a URl with number being the endpoint and with application/json header',
        () {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('trivia.json'), 200),
      );
      //act
      dataSource.getConcreteNumberTrivia(tNumber);
      //assert
      verify(mockHttpClient.get(
        'http://numbersapi.com/$tNumber',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return NumberTrivia when the response code is 200 (success)',
        () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('trivia.json'), 200),
      );
      //act
      final result = await dataSource.getConcreteNumberTrivia(tNumber);
      //assert
      expect(result, equals(tNumberTriviaModel));
    });

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        //arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response('Something went wrong', 404),
        );
        //act
        final call = dataSource.getConcreteNumberTrivia;

        //assert
        expect(() => call(tNumber), throwsA(isA<ServerException>()));
      },
    );
  });
}
