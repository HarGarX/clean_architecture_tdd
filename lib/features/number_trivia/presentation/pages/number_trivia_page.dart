import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: BlocProvider(
        builder: (_) => sl<NumberTriviaBloc>(),
        child: Container(),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              //Top half
              Container(
                //third of the size of the screen
                height: MediaQuery.of(context).size.height / 3,
                //Message Text widgets / CircularLoadingIndicator
                child: Placeholder(),
              ),
              SizedBox(
                height: 20,
              ),
              //Bottom half
              Column(
                children: <Widget>[
                  //TextField
                  Placeholder(
                    fallbackHeight: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        //Search concrete button
                        child: Placeholder(
                          fallbackHeight: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        //Random button
                        child: Placeholder(
                          fallbackHeight: 30,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
