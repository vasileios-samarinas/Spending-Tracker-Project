## About

Ruby web application where it allows users to track their spending by managing categories,
merchants and transactions. Built according to model-view- controller (MVC) design pattern, business
logic written in Ruby, back-end using a PostgreSQL database, front-end views and controller in HTML
and embedded Ruby parsed into Sinatra web framework, designed with CSS

## Run Application

1. Install PostgreSQL and create a database called spendingtracker by running the below commands

dropdb spendingtracker
createdb spendingtracker

2. Run twice the below command to make sure that tables have been created successfully

psql -d spendingtracker -f db/moneytracker.sql

3. Open a new tab on the terminal and run the below command to make sure that data from the database will be seeded to the tables.

ruby db/seeds.rb

4. Open a new tab on the terminal and run the below command to doublecheck that tables include the data from the database.

psql spendingtracker

5. Open a new tab on the terminal and the run the below command to start running the application.

ruby app.rb

Application is ready for use in the below link:

http://localhost:4567
