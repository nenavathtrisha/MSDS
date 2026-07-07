-- Create User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15),
    subscription_type VARCHAR(20)
);

-- Create Artist Table
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(50),
    genre VARCHAR(30)
);

-- Create Album Table
CREATE TABLE Album (
    album_id INT PRIMARY KEY,
    artist_id INT,
    title VARCHAR(100),
    release_date DATE,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

-- Create Song Table
CREATE TABLE Song (
    song_id INT PRIMARY KEY,
    album_id INT,
    title VARCHAR(100),
    duration INT,
    genre VARCHAR(30),
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

-- Insert Data
INSERT INTO User VALUES (1, 'Rohan', 'rohan@gmail.com', '9876543210', 'Premium');
INSERT INTO User VALUES (2, 'Rahul', 'rahul@gmail.com', '9876543211', 'Free');

INSERT INTO Artist VALUES (101, 'Arijit Singh', 'Bollywood');
INSERT INTO Artist VALUES (102, 'Anirudh Ravichander', 'South');

INSERT INTO Album VALUES (201, 101, 'Aashiqui 2', '2013-04-26');
INSERT INTO Album VALUES (202, 102, 'Master', '2021-01-13');

INSERT INTO Song VALUES (301, 201, 'Tum Hi Ho', 240, 'Romantic');
INSERT INTO Song VALUES (302, 202, 'Vaathi Coming', 210, 'Dance');

-- Playlist Table (used in inserts)
CREATE TABLE Playlist (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Playlist_Song Table
CREATE TABLE Playlist_Song (
    playlist_id INT,
    song_id INT,
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert into Playlist
INSERT INTO Playlist VALUES (401, 1, 'Favorites');
INSERT INTO Playlist VALUES (402, 2, 'Chill Songs');

-- Insert into Playlist_Song
INSERT INTO Playlist_Song VALUES (401, 301);
INSERT INTO Playlist_Song VALUES (402, 302);

-- Insert into Payment
INSERT INTO Payment VALUES (501, 1, 199.00, 'UPI', 'Completed');

-- Queries

-- 1. Display all songs
SELECT * FROM Song;

-- 2. Get songs with artist names
SELECT Song.title, Artist.name
FROM Song
JOIN Album ON Song.album_id = Album.album_id
JOIN Artist ON Album.artist_id = Artist.artist_id;

-- 3. Show user playlists
SELECT Playlist.playlist_name, User.name
FROM Playlist
JOIN User ON Playlist.user_id = User.user_id;

-- 4. Get songs in a playlist
SELECT Song.title
FROM Song
JOIN Playlist_Song ON Song.song_id = Playlist_Song.song_id
WHERE Playlist_Song.playlist_id = 401;