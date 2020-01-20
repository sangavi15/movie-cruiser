<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Favorites</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" type="text/css" href="styles/style.css" />
</head>
<body>
    <header> <label id="movie-cruiser">Movie cruiser</label> <img id="image-img"
        src="images/logo.png" width="40" height="40" /> <nav> <a href="ShowMovieListCustomer">Movies</a>
    <a id="link" href="ShowFavorite">Favorites</a> </nav> </header>
    <label id="movie-heading">Favorites</label>
    <c:if test="${removeFavoriteStatus==true}">
        <span id="notification">Movie Removed From Favorite Successfully</span>
    </c:if>
    <c:set var="favorite" value="${favorite}"></c:set>
    <table class="table">
        <col width="150"></col>
        <col width="180"></col>
        <col width="150"></col>
        <col width="100"></col>
        <tr>
            <th align="left">Title</th>
            <th align="right">Box Office</th>
            <th align="center">Genre</th>
        </tr>
        <c:forEach items="${movie}" var="movie">
            <tr>
                <td align="left">${movie.getTitle()}</td>
                <td align="right"><f:formatNumber type="currency" value="${movie.getBoxOffice()}" maxFractionDigits="0"/></td>
                <td align="center">${movie.getGenre()}</td>
                <td align="center"><a href="RemoveFavorite?movieId=${movie.getMovieId()}">Delete
                </a></td>
            </tr>
        </c:forEach>
        <tr>
            <th align="left">No-Of-favorites ${favorites.getNoOfFavorite()}</th>
        </tr>

    </table>

    <footer> <label id="copy-right">Copyright &copy; 2019</label> </footer>
</body>
</html>