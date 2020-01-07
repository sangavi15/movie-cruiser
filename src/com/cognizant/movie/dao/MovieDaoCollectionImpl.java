package com.cognizant.movie.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cognizant.movie.model.Movie;
import com.cognizant.movie.util.DateUtil;

public class MovieDaoCollectionImpl implements MovieDao {
    private static List<Movie> movieItemList; // instance variable

    public MovieDaoCollectionImpl() {
        if (movieItemList == null || movieItemList.isEmpty()) {
            Movie movie1 = new Movie(1, "Avatar", 2787965087L, true,
                    DateUtil.convertToDate("15/03/2017"), "Science Fiction", true);
            Movie movie2 = new Movie(2, "The Avengers", 1518812988L, true,
                    DateUtil.convertToDate("23/12/2017"), "Super Hero", false);
            Movie movie3 = new Movie(3, "Titanic", 2187463944L, true,
                    DateUtil.convertToDate("21/08/2017"), "Romance", false);
            Movie movie4 = new Movie(4, "Jurassic World", 1671713208L, false,
                    DateUtil.convertToDate("02/07/2017"), "Science Fiction", true);
            Movie movie5 = new Movie(5, "Avengers End Game", 2750760348L, true,
                    DateUtil.convertToDate("02/11/2022"), "Super Hero", true);
            movieItemList = new ArrayList<Movie>();
            movieItemList.add(movie1);
            movieItemList.add(movie2);
            movieItemList.add(movie3);
            movieItemList.add(movie4);
            movieItemList.add(movie5);
        }

    }

    @Override
    public Movie getMovieById(long movieId) {
        for (Movie movieItem : movieItemList) {
            if (movieItem.getMovieId() == movieId) {
                return movieItem;
            }

        }
        return null;
    }

    @Override
    public void modifyMovieList(Movie movieLists) {
        for (int i = 0; i < movieItemList.size(); i++) {
            if (movieItemList.get(i).getMovieId() == movieLists.getMovieId()) {
                movieItemList.set(i, movieLists);
            }

        }

    }

    @Override
    public List<Movie> getMovieListAdmin() {

        return movieItemList;
    }

    @Override
    public List<Movie> getMovieListCustomer() {
        ArrayList<Movie> movieItems = new ArrayList<Movie>();
        for (Movie movieItem : movieItemList) {
            if ((movieItem.getDateOfLaunch().before(new Date())
                    || movieItem.getDateOfLaunch().equals(new Date()))
                    && movieItem.isActive() == true) {
                movieItems.add(movieItem);
            }
        }

        return movieItems;
    }
}