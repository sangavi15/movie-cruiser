<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Movie List Admin</title>
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" type="text/css" href="styles/style.css" />
</head>
<body>
    <header> <label id="movie-cruiser">Movie Cruiser</label> <img id="image-img"
        src="images/logo.png" width="40" height="40" /> <nav> <a href="ShowMovieListAdmin">Movies</a>
    </nav> </header>
    <label id="movie-heading">Movies</label>
    <table class="table">
        <col width="200"></col>
        <col width="75"></col>
        <col width="75"></col>
        <col width="125"></col>
        <col width="100"></col>
        <col width="100"></col>
        <col width="75"></col>
        <tr>
            <th align="left">Title</th>
            <th align="right">Box Office</th>
            <th align="center">Active</th>
            <th align="center">Date of Launch</th>
            <th align="center">Genre</th>
            <th align="center">Has Teaser</th>
            <th align="center">Action</th>
        </tr>
        <c:forEach items="${movie}" var="movie">
            <tr>
                <td align="left">${movie.getTitle()}</td>
                 <td align="right"><f:formatNumber type="currency" value="${movie.getBoxOffice()}" maxFractionDigits="0"/></td>
                <td align="center"><c:choose>
                        <c:when test="${movie.isActive()==true}">Yes</c:when>
                        <c:otherwise>No</c:otherwise>
                    </c:choose></td>
                <td align="center"><f:formatDate value="${movie.getDateOfLaunch()}"
                        pattern="dd/MM/yyyy" /></td>
                <td align="center">${movie.getGenre()}</td>
                <td align="center"><c:choose>
                        <c:when test="${movie.isHasTeaser()==true}">Yes</c:when>
                        <c:otherwise>No</c:otherwise>
                    </c:choose></td>
                <td align="center"><a href="ShowEditMovie?movieId=${movie.getMovieId()}">Edit</a></td>
            </tr>
        </c:forEach>
    </table>
    <footer> <label id="copy-right">Copyright &copy; 2019</label> </footer>
</body>
</html>