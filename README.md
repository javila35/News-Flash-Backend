# News-Flash-Backend
Backend for a [news aggregator site](https://github.com/javila35/News-Flash-Frontend) project by [Joe Avila](https://github.com/javila35).

This database provides endpoints and stores information for authentication, users,  user comments, and bookmarks.

## Endpoints
### Auth
* Create: 
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
* Create
    * Creates a new user bookmark
    * Params
        * `user_id: number`
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

* Show
TODO: 
- [ ] Type return object
    * Retrieve a bookmark and it's comments
    * Params
        * `bookmark_id: number`
    * Returns json bookmark and comments* 
```ruby

```

### Comments
TODO:
- [ ] Type return object
- [ ] Are replies being displayed?
* Create
    * Creates a comment on a bookmark
    * Params
        * `user_id: number`
        * `bookmark_id: number`
        * `comment_text: string`
    * Returns json comment and replies(?)
```ruby

```

### Users
* Create
    * Creates a new user
    * Params
        * `id: number`
        * `username: string`
        * `first_name: string`
        * `location: string`
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

* Destroy
    * Deletes a user record
    * Params
        * `user_id: number`
    * Returns json status
```ruby
    status: string
```

* Index
    * Returns a username for each user record
```ruby
    string[]
```

* Show
- [ ] Type the return object
    * Retrieve an individual user
    * Params
        * `user_id: number`
    * Returns user record and serialized bookmarks and comments
```ruby
```

* Update
- [ ] Type the return object
    * Edit a user record
    * Params
        * `user_id: number`
    * Returns updated json user
```ruby
```