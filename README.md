# Spine-Rails

Easily setup and use Spine.js with Rails 3.1.


## Rails 3.1 setup
This gem requires the use of rails 3.1, coffeescript and the new rails asset pipeline provided by sprockets.

This gem vendors the latest version of spine.js for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use. 

For versions of Rails less than 3.1, it only provides the generator to install JavaScript file into public directory. 

### Installation

In your Gemfile, add this line:

    gem "spine-rails"
  
Then run the following commands:

    bundle install
    rails g spine:install

### Layout and namespacing

Running `rails g spine:install` will create the following directory structure under `app/assets/javascripts/`:
  
    models/
    views/
    controllers/
    
It will also create a toplevel `app.coffee` file to setup namespacing and initial requires.

## Generators
spine-rails provides 4 simple generators to help you get started.

### Model

    rails g spine:model User email username full_name
    
This generator creates a very minimal model inside `app/assets/javascript/models`. You need to provide the fileds to setup the model.

### Controller
    
    rails g spine:controller Users
    
This generator creates a minimal `Users` controller in `app/assets/javascripts/controllers` to get you started. No arguments requried.

### Views

    rails g spine:view users index show edit
    
This generator creates 3 minimal views (index, show, edit) in the `app/assets/javascripts/views/users' directory.
The first argument is the view folder to group the views by, the rest - view names themselves.

The generator will create views in `hamljs`, `eco` or `ejs` format, dependeing on which gems are availale:

- [rub-haml-js](https://github.com/dnagir/ruby-haml-js) - will use HAMLJS template
- [eco](https://github.com/sstephenson/eco) - will use ECO template
- otherwise - EJS.

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'spine-rails'

Install the gem and generate resource.

    bundle install
    rails g scaffold Post title:string content:string
    rake db:migrate
    rails g spine:install
    rails g spine:resource Post title content

You now have the default Spine data structures available to work with.
Now, go to `http://localhost:3000/posts` and open up JavaScript console in the browser.


Now you can use Spine:

  var post1 = App.Post.init({title:'Hi Spine!', content: 'It is cool!'}); // creates a new post
  post1.save(); // saves the post to the server
  post.id; // => 1 or similar
  // Similarly you can access Controllers
  var posts = new App.Posts();
  // Additionally, you can get quick access to the views from your controllers:
  posts.generate('index', post1); # this will render html for the view 'views/blogs/index'
