🎵 Music Streaming Database System (SQL)

📌 Overview

This project is a Music Streaming Database System implemented using SQL. It models how a typical music platform (like Spotify or Apple Music) manages users, artists, albums, songs, playlists, and payments.

The database is designed with proper relationships using Primary Keys and Foreign Keys to maintain data integrity.

---

🗂️ Database Schema

👤 User Table

Stores user details and subscription information.

- "user_id" (Primary Key)
- "name"
- "email" (Unique)
- "phone"
- "subscription_type" (Free / Premium)

---

🎤 Artist Table

Contains information about artists.

- "artist_id" (Primary Key)
- "name"
- "genre"

---

💿 Album Table

Stores albums created by artists.

- "album_id" (Primary Key)
- "artist_id" (Foreign Key)
- "title"
- "release_date"

---

🎶 Song Table

Holds song details.

- "song_id" (Primary Key)
- "album_id" (Foreign Key)
- "title"
- "duration" (in seconds)
- "genre"

---

📃 Playlist Table

Represents playlists created by users.

- "playlist_id" (Primary Key)
- "user_id" (Foreign Key)
- "playlist_name"

---

🔗 Playlist_Song Table

Many-to-many relationship between playlists and songs.

- "playlist_id" (Foreign Key)
- "song_id" (Foreign Key)

---

💳 Payment Table

Stores payment details for subscriptions.

- "payment_id" (Primary Key)
- "user_id" (Foreign Key)
- "amount"
- "payment_method"
- "status"

---

🔗 Relationships

- One Artist → Many Albums
- One Album → Many Songs
- One User → Many Playlists
- One Playlist ↔ Many Songs (Many-to-Many)
- One User → Many Payments

---

📊 Sample Data

The project includes sample data such as:

- Users: Rohan (Premium), Rahul (Free)
- Artists: Arijit Singh, Anirudh Ravichander
- Albums: Aashiqui 2, Master
- Songs: Tum Hi Ho, Vaathi Coming
- Playlists: Favorites, Chill Songs

---

🔍 SQL Queries Included

1️⃣ Display All Songs

SELECT * FROM Song;

2️⃣ Get Songs with Artist Names

SELECT Song.title, Artist.name
FROM Song
JOIN Album ON Song.album_id = Album.album_id
JOIN Artist ON Album.artist_id = Artist.artist_id;

3️⃣ Show User Playlists

SELECT Playlist.playlist_name, User.name
FROM Playlist
JOIN User ON Playlist.user_id = User.user_id;

4️⃣ Get Songs in a Playlist

SELECT Song.title
FROM Song
JOIN Playlist_Song ON Song.song_id = Playlist_Song.song_id
WHERE Playlist_Song.playlist_id = 401;

---

⚙️ Features

- Well-structured relational database
- Use of Primary Key and Foreign Key constraints
- Supports Many-to-Many relationships
- Includes real-world sample data
- Useful for learning SQL joins and database design

---

🚀 How to Run

1. Open MySQL / any SQL environment
2. Copy and paste the SQL script
3. Execute the script step-by-step
4. Run the queries to view results

---

📚 Learning Outcomes

- Understanding database normalization
- Working with joins (INNER JOIN)
- Designing relational schemas
- Managing real-world data relationships

---

👨‍💻 Author

Praveen Nenavath

---

⭐ If you like this project, consider giving it a star on GitHub!# MSDS