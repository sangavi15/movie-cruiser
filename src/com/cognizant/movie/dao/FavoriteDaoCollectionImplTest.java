package com.cognizant.movie.dao;

import java.util.List;

import com.cognizant.movie.model.Movie;

public class FavoriteDaoCollectionImplTest {
    static FavoriteDao favoriteDao = new FavoriteDaoCollectionImpl();

    public static void main(String[] args) {
        testAddFavorites();
        testGetAllFavorites();
        testRemoveFavorites();
        testGetAllFavorites();

    }

    public static void testAddFavorites() {
        System.out.println("Movie added  into favorites");
        favoriteDao.addFavoritesById(1, 2); // 1 is userId,2 is movieId
        favoriteDao.addFavoritesById(1, 3); // 1 is userId,3 is movieId

    }

    public static void testRemoveFavorites() {
        System.out.println("Remove favorite movie");
        favoriteDao.removeFavoritesById(1, 2);

    }

    public static void testGetAllFavorites() {
        try {
            System.out.println("Retrieving all the favorites");
            List<Movie> favorite = favoriteDao.getAllFavorites(1).getFavoriteList();
            for (Movie movie : favorite) {
                System.out.println(movie);
            }

        } catch (FavoriteEmptyException e) {
            System.out.println(e);
        }

    }

}
