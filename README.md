[![Build Status](https://semaphoreci.com/api/v1/projects/0d67889d-96c6-456b-9495-9c019aea57b6/598844/badge.svg)](https://semaphoreci.com/skorbut/blackwell)

blackwell
=========

Store content in mongo DB and render markdown. First prototype. Running at
https://cryptic-meadow-7722.herokuapp.com/

Install local mongo db via `docker pull mongo` and run it via `docker run --name some-mongo -p 27017:27017 -d mongo`


Run application via bundle exec puma -p 3000 -C config/puma.rb

Things to add:

* ~~deploy to heroku~~
* ~~users/authentication/ownership~~
* ~~fulltext search~~
* images/attachments
* tree structure to navigate
* ~~tags~~
* calendars based on tags
* proper forms
* localization
* some design
* history
