import 'package:dartz/dartz.dart';
import 'package:firstflutterapp/number_trivia/core/failure.dart';
import 'package:firstflutterapp/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaReposistory {
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}