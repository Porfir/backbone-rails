# Modified Backbone Rails

Its modified Backbone Rails project to use haml templates for js template views. It also gives you access to haml filters that make using underscore templates easy.

# HAML

You can use :js filter or js helper in templates.

Example:

    :js
      = model.get("value")
      = model.get("name")

    :js
      if condition
    .some_class
      some text
        = js(' model.get("value")')
    :js
      else
    alternative text
    :js
      end

# Backbone-Rails

Easily setup and use backbone.js (0.5.0) with rails 3.1

## Rails 3.1 setup
This gem requires the use of rails 3.1, coffeescript and the new rails asset pipeline provided by sprockets.

This gem vendors the latest version of underscore.js and backbones.js for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use. 
    
### Installation

In your Gemfile, add this line:

    gem "rails-backbone", :git => "git://github.com/software-project/backbone-rails.git"
  
Then run the following commands:

    bundle install
    rails g backbone:install

### Layout and namespacing

Running `rails g backbone:install` will create the following directory structure under `app/assets/javascripts/backbone`:
  
    routers/
    models/
    views/

Templates are saved to `app/views/model_name`:
    
It will also create a toplevel app_name.coffee file to setup namespacing and setup initial requires.
    
## Generators
backbone-rails provides 3 simple generators to help get you started using bacbone.js with rails 3.1. 
The generators will only create client side code (javascript).

### Model Generator

    rails g backbone:model
    
This generator creates a backbone model and collection inside `app/assets/javascript/backbone/models` to be used to talk to the rails backend.

### Routers
    
    rails g backbone:router
    
This generator creates a backbone router with corresponding views and templates for the given actions provided.

### Scaffolding

    rails g backbone:scaffold
    
This generator creates a router, views, templates, model and collection to create a simple crud single page app

## Example Usage

Say we have just created a new rails 3.1 application called `blog`. Edit your gemfile and add `gem rails-backbone`.

Install the gem and generate scaffolding.

    bundle install
    rails g backbone:install
    rails g scaffold Post title:string content:string
    rake db:migrate
    rails g backbone:scaffold Post title:string content:string
    
You now have installed the backbone-rails gem, setup a default directory structure for your frontend backbone code. 
Then you generated the usual rails server side crud scaffolding and finally generated backbone.js code to provide a simple single page crud app.
You have one last step:

Edit your posts index view `app/views/posts/index.html.erb` with the following contents:

    <div id="posts"></div>

    <script type="text/javascript">
      $(function() {
        window.router = new Blog.Routers.PostsRouter({posts: <%= @posts.to_json.html_safe -%>});
        Backbone.history.start();
      });
    </script>
    
Now start your server `rails s` and browse to [localhost:3000/posts](http://localhost:3000/posts)
You should now have a fully functioning single page crud app for Post models.