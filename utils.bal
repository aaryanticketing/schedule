function generateWeatherTable(WeatherRecordList weatherRecords) returns string {
    // Define the table header
    string[] columns = ["   Date and Time   ", "Description", "Temperature", "Humidity", "Wind", "Cloud"];
    string separator = " | ";
    string wtable = separator;

    // Add the table header
    foreach var column in columns {
        wtable = wtable + column + separator;
    }
    wtable = wtable + "\n";
    
    // Add the table body
    foreach var wrecord in weatherRecords.list {
        wtable = wtable + separator + wrecord.dt_txt + separator + wrecord.weather[0].description
        + separator + (wrecord.main.temp - 273.0).round(2).toString() + separator + (wrecord.main.humidity).toString()
        + "%" + separator + (wrecord.wind.speed).toString() + " m/s, " + (wrecord.wind.deg).toString()
        + "°" + separator + (wrecord.clouds.all).toString() + "%" + separator + "\n";
    }

    // Add the table footer
    wtable = wtable + "\n";
    return wtable;
}

function generateMovieTable(Movie[] movies) returns string {

    // Add table header
    var html = "<table><tr><th>Movie Name<th>Description<th>Image<th>Start Date<th>End Date</th></tr>";
    
    // Add the table body
    foreach var movie in movies {
        html = html + "<tr>";
        html = html + "<td>" + movie.movie_name + "</td>";
        html = html + "<td>" + movie.description_text + "</td>";
        html = html + "<td>" + movie.image + "</td>";
        html = html + "<td>" + movie.start_date + "</td>";
        html = html + "<td>" + movie.end_date + "</td>";
        html = html + "</tr>";
    }

    // Add the table footer
    html = html + "</table>";
    return html;
}

function generateHtml(Movie[] movies) returns string {

    // Add HTML header
    var html = "<!DOCTYPE html><style>body{font-family:Arial,sans-serif;margin:0;padding:0;background-color:#f4f4f4}h2{text-align:center;margin-top:20px}table{border-collapse:collapse;width:80%;margin:20px auto;background-color:#fff;border-radius:8px;overflow:hidden;box-shadow:0 2px 4px rgba(0,0,0,.1)}td,th{border:1px solid #ddd;text-align:left;padding:12px}th{background-color:#4caf50;color:#fff;text-transform:uppercase}tr:nth-child(even){background-color:#f2f2f2}tr:hover{background-color:#ddd}td:first-child{font-weight:700}</style>";
    
    // Add movies table 
    var moviesTable = generateMovieTable(movies);
    html = html + "<h2>Sample Table</h2>" + moviesTable;

    // Add HTML footer
    html = html + "</body></html>";
    return html;
}
