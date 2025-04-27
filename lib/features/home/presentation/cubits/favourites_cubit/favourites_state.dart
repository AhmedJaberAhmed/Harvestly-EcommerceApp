part of 'favourites_cubit.dart';

@immutable
sealed class FavouritesState {}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesAdded extends FavouritesState {
  FavouritesAdded({required this.favourites});
  List<ProductEntity> favourites;
}

final class FavouritesRemoved extends FavouritesState {}

final class FavouritesFailure extends FavouritesState {
  final String errMessage;
  FavouritesFailure(this.errMessage);
}

final class FavouritesSuccess extends FavouritesState {
  List<ProductEntity> favourites;
  FavouritesSuccess({required this.favourites});
}

final class FavouritesLoading extends FavouritesState {}
