
Content and Objectives:

1. Create a basic app for exercise
2. This app will let someone create an account or log in to an existing account
3. A person can add an exercise with its details as well as edit and delete
4. The details will be the date, name of exercise, number of reps and the time
5. The app is based on the concept of Active Record with CRUD as well as the restful routes concept
6. It will have the MVC concept (Model, View, Controller)
7. The models will be responsible for the classes
8. The controller will be responsible for execution
9. The views will be responsible for what is visible on the app
10. Install gems
11. Use migrtions and schema

For Models:
Create the relationships

For Views:
Use shotgun

For Controller:
Use helper methods as well

-app
  |- controllers
      |- application_controller.rb
	-client_controller.rb
	-exercise_controller.rb
  |- models
      |- client.rb has_many relationship
	-exercise.belongs_to relationship
  |- views
       |- clients
          |- new.erb
	   -index.erb
	   -show.erb
	   -edit.erb		
      |- exercises
          |-edit.erb
	   -index.erb
           -new.erb 
           -show.erb
      
-config
-db
-spec
-readme