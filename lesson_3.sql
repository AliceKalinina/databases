DROP TABLE IF EXISTS music;
CREATE TABLE music (
     id SERIAL,
     loader_user_id BIGINT UNSIGNED NOT NULL,
     artist VARCHAR(255),
     genre VARCHAR(255),
     album VARCHAR (255),
     track BLOB,
     add_at DATETIME DEFAULT NOW()
     
);
    
DROP TABLE IF EXISTS user_music;
CREATE TABLE user_music (
     id SERIAL,
     loader_user_id BIGINT UNSIGNED NOT NULL,
     user_id BIGINT UNSIGNED NOT NULL,
     add_at DATETIME DEFAULT NOW(),
     deleted_at DATETIME DEFAULT NOW(),
     listen_at DATETIME ON UPDATE NOW(),
     
     FOREIGN KEY (user_id) REFERENCES users (id),
     FOREIGN KEY (loader_user_id) REFERENCES music (id)
);
    
DROP TABLE IF EXISTS friends_music;
CREATE TABLE friends_music (
     id SERIAL,
     user_id BIGINT UNSIGNED NOT NULL,
        
     FOREIGN KEY (user_id) REFERENCES music (id),
     FOREIGN KEY (user_id) REFERENCES user_music (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
);
   

DROP TABLE IF EXISTS friendship;
CREATE TABLE friendship (
    subcribed_user_id BIGINT UNSIGNED NOT NULL,
    recipient_user_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (subcribed_user_id) REFERENCES users (id),
    FOREIGN KEY (recipient_user_id) REFERENCES users (id),
    FOREIGN KEY (subcribed_user_id) REFERENCES music (id),
    FOREIGN KEY (recipient_user_id) REFERENCES music (id) 
);    

