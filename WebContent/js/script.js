
function validateMovieForm() {

    var name = document.forms["movieForm"]["title"].value;
    var nameRegExp = (/^[a-z: A-Z]{2,100}$/);
    if (name == "") {
        alert("Title is required");
        return false;
    }
    if (!name.match(nameRegExp)) {
        alert("Title should have 2-100 characters.");
        return false;
    }
    var boxOffice = document.forms["movieForm"]["boxOffice"].value;
    if (boxOffice == "") {
        alert("Box Office is required.");
        return false;
    }
    if (isNaN(boxOffice)) {
        alert("Box Office has to be a number.");
        return false;
    }
    var dateOfLaunch = document.forms["movieForm"]["dateOfLaunch"].value;
    if (dateOfLaunch == "") {
        alert("Date of Lauch is required");
        return false;
    }
    var genre = document.forms["movieForm"]["genre"].value;
    if (genre == "") {
        alert("Select one genre");
        return false;
    }
}