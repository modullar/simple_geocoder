# Requirements:

Ruby version 2.5.1
Rails version 5.2.1


# Setup

Clone the repo.
Run 
`rake db:create`  
`bundle install`  
`rails s`  
and for test  
`bundle exec rspec`

Add your `app_code` & `app_id` to the secrets.
`EDITOR=vim rails credentials:edit`
You can obtain by signing up on [Here](https://developer.here.com/plans) for free
# Remarks

Valid Result Example `Kamerunerstr Berlin`
Invalid Result Example: `Kamerunerstr`

- API endpoints are not RESTful like but that would be ideal to have them RESTful like but the requirement is so simple so it won't also be needed.

- [Here](https://www.here.com/en) was used to do the geocoding


# Possible future Improvements

- autocomplete search for the textbox
