import 'package:clean_architecture_tdd_course/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(text: 'Test Text', number: 1);

  test('should be a subclass of NumberTivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });
}
