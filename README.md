# Bookmarkulum
(provisional title, awaiting for publishing rights)


## Basic Model Structure

- `Bookmark` (belongs to Site)
    - `title`      (required)
    - `URL`        (required)
    - `shortening` (generated if empty)
    - `Site id`    (belongs to Site)

- `Site`
    - `top_level_URL`

## Project Plan

- Create bare `Rails` app with `postgresql`    
    It is quite important to specify that from the beginning because it's always terrible to switch from the default `SQLite` to `Postgresql`. I've been there.     
    And, if it has to be deployed, choosing Postresql from the start will make you avoid so many headaches.
    - Implement `Static Pages`   
        Some Static Pages are almost always useful for many reasons: mainly to test if it's working, especially with annoying servers in production (I'm looking at you, DigitalOcean), secondly an `About` page where you can put information is often useful.
    - Deploy super early, just to be sure everything works nicely and Heroku isn't being a jerk.

- Put in Bootstrap   
    I'd prefer to use the `bootstrap-sass` gem   
        - optionally put a Bootstrap theme, but this has low priority
    - Deploy again
- Start writing failing tests
    - add more tests   
    - controller
        - check for pages
    - model
        - validations (title and URL for Bookmarks)
            - blank fields
            - valid URL addresses
            - uniqueness of `Site`
        - relationships
            - Bookmark should belong to Site
            - Site deletes Bookmarks
            - Last Bookmark deletes Site    
    - integration
        - invalid submissions (create and edit)
        - flash messages
        - pagination
        - Bookmark should create Site if not already present    
- Implement Bookmarks
    - early set up
        - populate the Database with many nice `seeds`   
            - the gem `faker` can give you many nice names (like names of Pokemons)
        - implement a `REST`-ful model 
            - `index`, `show`, `edit`, `new` pages (plus `create`, `update` and `destroy` actions)
    - deploy in production to check if it still works
        - fix the many problems that production may spew at you
    - further set up
        - first implement just `create`
        - then also implement `edit`
        - tests in the green 
    - deploy again
    - refactor with `partials` for `new` and `edit`
    - advanced set up
        - add pagination
- Implement Sites
    - follow "Implement Bookmarks" workflow
- Restrict Routes
    - Sometimes more Routes than needed are created by mistake, check that
- Implement Tags
    - write tests
    - `tag` 
        - has many `taggings`
        - has many `bookmarks` through `taggings`
    - `taggings` 
        - belongs to `tag` 
        - belongs to `bookmark`
- Implement Search
    - write tests
    - play with SQL till it works and copy that code
- Do a pass with Rubocop and Reek to find really bad code that I'll be ashamed to admit I've even written


## Refactor

- terrible CSS

- db/seeds.rb DELETES every Site and every Bookmark every time you seed. 
It's very useful in developing, but be careful with that in production

## To Do

### css
- add active page with css in the navigation menu
- links to javascripts and stylesheets should be the railsy way

### models
- top_site_domain should be parsed 
    - capsdown
    - trim www and other things

### views


### tests
- test the URL parser
    - URLs need the http protocol, it cold be added while saving the bookmark
- test #destroy_sites_with_no_bookmarks

### ideas
- implement an engine to shorten URLs without using third party APIs nor Gems


