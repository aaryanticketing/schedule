import wso2/choreo.sendemail;
import ballerina/io;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

configurable string host = ?;
configurable int port = ?;
configurable string user = ?;
configurable string password = ?;
configurable string database = ?;
configurable string email = ?;
const emailSubject = "Aaryan Ticket Statistics";

// Create a new email client
sendemail:Client emailClient = check new ();

public function main() returns error? {

    final mysql:Client db;
    db = check new (host, user, password, database, port);

    Movie[] movies = check getMovies(db);
    io:println(movies);

    // Send the email
    string _ = check emailClient->sendEmail(email, emailSubject, generateHtml(movies));
    io:println("Successfully sent the email.");
}

function getMovies(mysql:Client db) returns Movie[]|error {

    stream<Movie, sql:Error?> movieStream = db->query(`SELECT * FROM Movie`);
    return from Movie movie in movieStream select movie;
}
