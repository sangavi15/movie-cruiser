package com.cognizant.movie.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cognizant.movie.model.Favorite;
import com.cognizant.movie.model.Movie;

public class FavoriteDaoCollectionImpl implements FavoriteDao {
    public static HashMap<Long, Favorite> userFavorites;

    public FavoriteDaoCollectionImpl() {
        if (userFavorites == null) {
            HashMap<Long, Favorite> favorites = new HashMap<Long, Favorite>();
            userFavorites = favorites;
        }
    }

    @Override
    public Favorite getAllFavorites(long userId) throws FavoriteEmptyException {
        Favorite favorites = userFavorites.get(userId);
        if (favorites == null || favorites.getFavoriteList().isEmpty()) {
            throw new FavoriteEmptyException();
        }

        int total = favorites.getFavoriteList().size();
        favorites.setTotal(total);
        return favorites;

    }

    @Override
    public void addFavoritesById(long userId, long movieId) {
        MovieDao movies = new MovieDaoCollectionImpl();
        Movie movie = movies.getMovieById(movieId);
        if (userFavorites.containsKey(userId)) {
            userFavorites.get(userId).getFavoriteList().add(movie);
        } else {
            Favorite favorite = new Favorite();
            List<Movie> movielist = new ArrayList<Movie>();
            movielist.add(movie);
            favorite.setFavoriteList(movielist);
            userFavorites.put(userId, favorite);

        }

    }

    @Override
    public void removeFavoritesById(long userId, long movieId) {
        List<Movie> list = userFavorites.get(userId).getFavoriteList();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getMovieId() == movieId) {
                list.remove(i);
                break;
            }
        }

    }

}
