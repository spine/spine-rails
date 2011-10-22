# Spine-Rails

Easily setup and use [Spine](http://spinejs.com) with Rails 3.1.

## Rails 3.1 setup

This gem requires the use of [Rails 3.1](http://rubyonrails.org), [CoffeeScript](http://jashkenas.github.com/coffee-script/) and the new Rails asset pipeline provided by [Sprockets](http://getsprockets.org).

This gem does two things:

* Adds Spine to the asset pipeline, so you can easily require it in your applications: `//= require spine`
    
* Adds some Spine generators, so you can easily create Spine Models, Views and Controllers.

### Installation

In your Gemfile, add this line:

    gem "spine-rails"
  
Then run the following commands:

    bundle install
    
    rails generate spine:new

### Layout and namespacing

Running `rails g spine:new` will create the following directory structure:
  
    app/assets/javascripts/app/models/
    app/assets/javascripts/app/views/
    app/assets/javascripts/app/controllers/
    app/assets/javascripts/app/index.js.coffee
    
By default your application will be namespaced by the `app` directory. You can specify a different namespace with the `--app` option:

    rails g spine:new --app foo_bar
    
**NOTE:** If you use the `--app` option here, then you will also have to specify it with other generators.

Use the top-level level `index.js.coffee` file to setup namespacing and initial controller instantiation.

## Generators

spine-rails provides three simple generators to help you get started:

### Model

    rails g spine:model User email username full_name
    
This generator creates a very minimal model inside `app/assets/javascript/app/models`. You have to provide a list of attributes for the model.

### Controller
    
    rails g spine:controller Users
    
This generator creates a minimal `Users` controller in `app/assets/javascripts/app/controllers` to get you started. 

### View

    rails g spine:view users/index
    
This generator creates a blank Spine view `app/assets/javascripts/app/views/users/index.jst.ejs`.

The generator will create views in `hamljs`, `eco` or `ejs` format, depending on the gems availale:

1. [eco](https://github.com/sstephenson/eco) - will use ECO templates
2. [rub-haml-js](https://github.com/dnagir/ruby-haml-js) - will use HAMLJS templates
3. otherwise, EJS templates will be used

## Example Usage

Created a new Rails 3.1 application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem "spine-rails"

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

    // Sends an AJAX POST to the server
    var post = App.Post.create({
      title: 'Hello World!', 
      content: 'Spine & Rails, sitting in a tree!'
    }); 

    // => ID returned from Rails
    post.id; 
    
    // Sends AJAX PUT to the server
    post.updateAttributes({title: 'Goodbye'});
    
Reload the page, then:

    App.Post.fetch(); // Fetch all posts
    
    App.Post.first().content;
    
For more information on how to integrate Spine with Rails, please see the [Rails guide](http://spinejs.com/docs/rails).

Also if you want to have some useful helpers to bridge the gap between Spine and Rails, then [spine-extensions](https://github.com/dnagir/spine-extensions) is for you.

## Attributions

This plugin was made by [Alex MacCaw](http://alexmaccaw.co.uk) with major contributions from [Dmytrii Nagirniak](https://github.com/dnagir). It's under the same license as [Spine](http://spinejs.com) (MIT).
