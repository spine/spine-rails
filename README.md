# Spine-Rails

Easily setup and use [Spine](http://spinejs.com) with Rails 3.1.

## Rails 3.1 setup

This gem requires the use of [Rails 3.1](http://rubyonrails.org), [CoffeeScript](http://jashkenas.github.com/coffee-script/) and the new Rails asset pipeline provided by [Sprockets](http://getsprockets.org).

This gem does two things:

* Adds Spine to the asset pipeline, so you can easily require it in your applications: `//= require spine`
    
* Adds some Spine generators, so you can easily create Spine Models, Views and Controllers.

For versions of Rails less than 3.1, it only provides the generator to install JavaScript file into public directory. 

### Installation

In your Gemfile, add this line:

    gem "spine-rails"
  
Then run the following commands:

    bundle install
    
    rails generate spine:new

### Layout and namespacing

Running `rails g spine:new` will create the following directory structure:
  
    app/assets/javascripts/models/
    app/assets/javascripts/views/
    app/assets/javascripts/controllers/
    app/assets/javascripts/app.coffee
    
It will also create a top level `app.coffee` file to setup namespacing and initial controller instantiating.

## Generators

spine-rails provides 4 simple generators to help you get started:

### Model

    rails g spine:model User email username full_name
    
This generator creates a very minimal model inside `app/assets/javascript/models`. You can optionally provide a list of attributes for the model.

### Controller
    
    rails g spine:controller Users
    
This generator creates a minimal `Users` controller in `app/assets/javascripts/controllers` to get you started. 

### View

    rails g spine:view users/index
    
This generates creates blank Spine views in the `app/assets/javascripts/views/users` directory. 

The generator will create views in `hamljs`, `eco` or `ejs` format, depending on which gems are availale:

- [eco](https://github.com/sstephenson/eco) - will use ECO templates
- [rub-haml-js](https://github.com/dnagir/ruby-haml-js) - will use HAMLJS templates
- otherwise, EJS templates will be used

## Example Usage

Created a new rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'spine-rails'

Install the gem and generate resource.

    bundle install
    
    rails g scaffold Post title:string content:string
    rake db:migrate
    
    rails g spine:new
    rails g spine:model Post title content
    rails g spine:controllers Posts

You now have the default Spine data structures available to work with.

Next navigate to [http://localhost:3000/posts](http://localhost:3000/posts), and open up the JavaScript console in the browser.

Now you can use Spine:

    var post = new App.Post({title:'Hello World!', content: 'Spine & Rails, sitting in a tree!'});
    
    post.save(); // Sends an AJAX POST to the server
    
    post.id; // => ID returned from Rails
    
    post.updateAttributes({title: 'Goodbye'}); // Sends AJAX PUT to the server
