import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc() : super();

  @override
  // TODO: implement initialState
  NumberTriviaState get initialState => throw UnimplementedError();

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
