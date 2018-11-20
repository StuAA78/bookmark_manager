# bookmark_manager
# User stories

```
As a User
So that I can easily locate pages I want to find again
I want to be shown a list of bookmarks
```
![Bookmark Manager domain model](https://github.com/GDSNewt/bookmark_manager/blob/master/images/bookmark_mgr%20domain%20model.001.png)


```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

# Database setup instructions
1. Open ```psql```
2. ```CREATE DATABASE "bookmark_manager";```
3. ```CREATE TABLE "bookmarks" (id SERIAL PRIMARY KEY, url VARCHAR(60));```
