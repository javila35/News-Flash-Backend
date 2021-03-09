# News-Flash-Backend
Backend for a [news aggregator site](https://github.com/javila35/News-Flash-Frontend) project by [Joe Avila](https://github.com/javila35).

This database provides endpoints and stores information for authentication, users,  user comments, and bookmarks.

## Endpoints
### Auth
* Create: POST /auth
    * Creates a new authenticated session.
    * Params
        * `username: string`
        * `password: string`
    * Returns json user & token
```ruby
    {
        user: {
            # User's unique ID
            id: number
            # User's unique username
            username: string
            # User provided first name (optional)
            first_name: string
            # User provided bio (optional)
            bio: string
            # User provided location (optional)
            location: string
        },
        jwt: JWT encoded token
    }
```

### Bookmarks
* Create: POST /bookmarks
    * Creates a new user bookmark
    * Params
        * `user_id: number` # User to associate created
        * `title: string`: # Title / Headline for the article
        * `link: string`: # Link to the article for anchor href attribute
        * `img_url: string`: # Link to image for img src attribute
    * Returns json bookmark
```ruby
    {
        # Link to image for img src attribute
        article_img: string
        # Title / Headline for the article
        article_title: string
        # Link to the article for anchor href attribute
        article_link: string        
    }
```

* Show: GET	/bookmarks/:id
    * Retrieve a bookmark and it's comments
    * Params
        * `id: number`
    * Returns serialized json bookmark and comments* 
```ruby
    {
        # Bookmark id
        id: number
        attributes: {
            # Link for article image
            article_img: string
            # Link for published article
            article_link: string
            # Headline of article
            article_title: string
            # Array of comment objects
            comments: Comment[]
        }

    Comment = {
        # Comment record id
        id: number
        # User the comment belongs to
        user_id: number
        # Bookmark the comment belongs to
        bookmark_id: number
        # Text to display
        comment_text: string
    }
    }
```

### Comments
* Create: POST /comments
    * Creates a comment on a bookmark
    * Params
        * `user_id: number`
        * `bookmark_id: number`
        * `comment_text: string`
    * Returns json comment and replies(?)
```ruby
    {
        # Comment id
        id: number
        # User the comment belongs to
        user_id: number
        # Bookmark the comment belongs to
        bookmark_id: number
        # Text to display
        comment_text: string
    }
```

### Users
* Create: POST	/users
    * Creates a new user
    * Params
        * `username: string`
        * `password: string`
    * Returns a json user & jwt token
```ruby
    {
        user: {
            # User's unique id
            id: number
            # User's unique username
            username: string
            # Optional user provided name
            first_name: string
            # Optional user provided location
            location: string
        }
        jwt: JWT encoded token
    }
```

* Destroy: DELETE	/users/:id
    * Deletes a user record
    * Params
        * `id: number`
    * Returns json status
```ruby
    status: string
```

* Index: 	GET	/users
    * Returns a username for each user record
```ruby
    string[]
```

* Show: GET	/users/:username
    * Retrieve an individual user
    * Params
        * `username: string`
    * Returns user record and serialized bookmarks and comments
```ruby
    {
        data: {
            id: number,
            type: "user",
            attributes: {
                username: string
                first_name: string
                location: string
                bio: string
                bookmarks: Bookmark # See Bookmark endpoint for typing
            }
        }
    }
```

* Update: PATCH /users/:id
    * Edit a user record
    * Params
        * `id: number`
        * User Property to update. Examples: `username: string`, `bio: string`, etc
    * Returns updated json user
```ruby
{
    username: string
    id: number
    first_name: string
    bio: string
    location: string
}
```