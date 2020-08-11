# README

### System dependencies: 
Ruby version: 2.7.1

'ImageMagick' package.
```
sudo apt update
sudo apt install imagemagick
```
### Install gems

```bash
bundle install
```

**Note**: if you run into `Bundler could not find compatible versions for gem "sprockets":` error message, please run

```bash
bundle update
```

### Create .env file
```bash
bundle exec rails db:create
```

### Use the install generators to set up Spree

```shell
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rake spree_roles:permissions:populate # To populate user and admin roles with their permissions
bundle exec rake spree_roles:permissions:populate_permission_sets # To set up some convenient permission sets.
```

### Run the server

```shell
bundle exec rails s
```