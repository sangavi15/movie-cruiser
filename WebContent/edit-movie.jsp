<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Edit-Movie</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<script src="js/script.js"></script>
</head>
<body>
    <c:set var="movie" value="${movie}"></c:set>
    <header> <label id="movie-cruiser">Movie Cruiser</label> <img id="image-img"
        src="images/logo.png" width="40" height="40" /> <nav> <a href="ShowMovieListAdmin">Movies</a>
    </nav> </header>
    <label id="movie-heading">Edit Movie</label>
    <form action="EditMovie" method="post" name="movieForm" onsubmit="return validateMovieForm()">
        <input type="hidden" name="movieId" value="${movie.getMovieId()}" />
        <table cellspacing="5">
            <tr>
                <th align="left" colspan="4"><label class="grey" for="name">Title</label></th>
            </tr>
            <tr>
                <td colspan="4"><input type="text" name="title" id="name" autocomplete="off"
                    value="${movie.getTitle()}" placeholder="Avengers - End Game" /></td>
            </tr>
            <tr>
                <th align="left"><label class="grey" for="boxoffice">Gross ($)</label></th>
                <th align="left"><label class="grey" for="active">Active</label></th>
                <th align="left"><label class="grey" for="dol">Date of Launch</label></th>
                <th align="left"><label class="grey" for="gen">Genre</label></th>
            </tr>
            <tr>
                <td><input type="text" name="boxOffice" id="boxoffice"
                    value="${movie.getBoxOffice()}" autocomplete="off" placeholder="2787965087"
                    size="10px" /></td>
                <td><c:choose>
                        <c:when test="${movie.isActive()==true}">
                            <input type="radio" value="Yes" name="active" checked="checked" />Yes<input
                                type="radio" value="No" name="active" />No
                    </c:when>
                        <c:otherwise>
                            <input type="radio" value="Yes" name="active" />Yes<input type="radio"
                                value="No" name="active" checked="checked" />No
                     </c:otherwise>
                    </c:choose></td>
                <td><f:formatDate value="${movie.getDateOfLaunch()}" pattern="dd/MM/yyyy"
                        var="dateOfLaunch" /> <input type="text" name="dateOfLaunch"
                    id="dateOfLaunch" value="${dateOfLaunch}" autocomplete="off"
                    placeholder="27/04/2022" /></td>
                <td><select name="genre">
                        <option value="${movie.getGenre()}">${movie.getGenre()}</option>
                        <option value="Science Fiction">Science Fiction</option>
                        <option value="Superhero">Superhero</option>
                        <option value="Romance">Romance</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Adventure">Adventure</option>
                        <option value="Thriller">Thriller</option>
                </select></td>
            </tr>
            <tr>
                <td><c:choose>
                        <c:when test="${movie.isHasTeaser()==true}">
                            <input type="checkbox" name="hasTeaser" value="Yes" checked="checked" />Has Teaser
            </c:when>
                        <c:otherwise>
                            <input type="checkbox" name="hasTeaser" value="No" />Has Teaser
            </c:otherwise>
                    </c:choose></td>

            </tr>
            <tr>
                <td colspan="4"><input type="submit" value="Save" name="submit" id="submit" /></td>
            </tr>
        </table>
    </form>
    <footer> <label id="copy-right">Copyright &copy; 2019</label> </footer>
</body>
</html>