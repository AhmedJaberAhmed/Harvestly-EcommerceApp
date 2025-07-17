import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/product_Entity.dart';
import '../../../../../core/helper_functions/databases/databaseFav.dart';
part 'favourites_state.dart';




class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  List<FavoriteModel> favorites = [];

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    favorites = await FavoriteDatabase.instance.getFavorites();
    emit(FavoriteLoaded(favorites));
  }

  Future<void> toggleFavorite(FavoriteModel product) async {
    final isFav = await FavoriteDatabase.instance.isFavorite(product.code);

    if (isFav) {
      await FavoriteDatabase.instance.removeFavorite(product.code);
    } else {
      await FavoriteDatabase.instance.addFavorite(product);
    }

    await loadFavorites();

  }

  Future<bool> isFavorite(String code) async {
    return await FavoriteDatabase.instance.isFavorite(code);
  }
}
