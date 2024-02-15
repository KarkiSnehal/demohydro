import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:hydrogang/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
