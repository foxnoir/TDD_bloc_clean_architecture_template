import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture/core/errors/failures.dart';

/// short generetic name for types

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef Result<T> = Either<Failure, T>;

typedef DataMap = Map<String, dynamic>;
