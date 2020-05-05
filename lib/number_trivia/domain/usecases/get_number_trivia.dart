import 'package:dartz/dartz.dart';
import 'package:firstflutterapp/number_trivia/core/failure.dart';
import 'package:firstflutterapp/number_trivia/domain/entities/number_trivia.dart';
import 'package:firstflutterapp/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:meta/meta.dart';

class GetNumberTrivia {
  NumberTriviaReposistory _repository;

  GetNumberTrivia(this._repository);

  Future<Either<Failure, NumberTrivia>> execute({
    @required int number,
  }) async {
    return await _repository.getConcreteNumberTrivia(number);
  }
}

