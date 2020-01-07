package com.cognizant.movie.dao;

import java.util.List;

import com.cognizant.movie.model.Movie;

public class FavoriteDaoCollectionImplTest {
    static FavoriteDao favDao = new FavoriteDaoCollectionImpl();
    
    public static void main(String[] args){
        testAddFavorites();
        testGetAllFavorites();
        testRemoveFavorites();
        testGetAllFavorites();
        
        
    }
    public static void testAddFavorites(){
        System.out.println("Movie added item into favorites");
        favDao.addFavoritesById(1, 2); // 1 is userId,2 is movieId
        favDao.addFavoritesById(1, 3); // 1 is userId,3 is movieId

    }
    

    public static void testRemoveFavorites(){
        System.out.println("Remove favorite movie");
        favDao.removeFavoritesById(1, 2);
        
    }
    public static void testGetAllFavorites(){
        try {
            System.out.println("Retrieving all the favorites");
            List<Movie> fav=favDao.getAllFavorites(1).getFavoriteList();
            for(Movie movie:fav ) {
                System.out.println(movie);
            }
            System.out.println("No Of favorites :" +  favDao.getAllFavorites(1).getTotal());
            
        }catch(FavoriteEmptyException e) {
            System.out.println(e);
        }
        
        
    }

}
