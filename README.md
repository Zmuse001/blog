# BLOG

* General Information 
This application is a blog where people can come and read up on the many different topics of their interests. 

* Features 
You can Look at articles,
You can look at the many Categories o even create your own,
You can delete any category you no longer need,
You can edit something that's outdated or no longer useful 

* Validation 
We had to validate that a Category had a name and that it was unique

* Category Description 
We had to add a description column to our database, we made it so that each category had it's own description. we added Category.description to the show.html.erb in categories to put the description on the page. 

* C - Action:
We had to create def to make category look for params and then created an if statement to a save categories and redirect it to categories_path 

* R - Action 
We had to create a index def and in the view we created an index.html.erb so we could show what the controller is passing to the view. 

* U - Action: 
We created an update def that if the params are updated redirect to the category_path 

* D - Action: 
We created a destroy def that would delete a category once it found it's params and would delete it from the database as a whole 

* Category Count
We added a line of erb code to the index.html.erb inside of categories in view. this allowed us to show the number of articles in each category 

* Style the pages using css 
We styled the application using css in the stylesheets 

* Read.me 
We created a Read.me with step by step of the process 