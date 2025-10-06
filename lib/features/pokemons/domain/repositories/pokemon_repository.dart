import 'package:either_dart/either.dart';

import '../entities/pokemon.dart';
import '../../../../core/errors/failure.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList(int offset, int limit);
}
