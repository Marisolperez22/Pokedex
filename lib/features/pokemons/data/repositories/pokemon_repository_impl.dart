import 'package:either_dart/either.dart';
import 'package:pokedex/features/pokemons/data/models/pokemon_model/pokemon_model.dart';
import '../../domain/entities/pokemon.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/error_mapper.dart';
import '../datasources/pokemon_remote_datasource.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remote;

  PokemonRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList(
    int offset,
    int limit,
  ) async {
    try {
      final models = await remote.getPokemonList(offset, limit);
      final entities = models.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
