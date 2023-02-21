# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## List Of Issues / Implemented Features:
1. Cost accepting 0 and negative values, any chars (Solved + Added test cases)
2. Cost presence check (Solved + Added test cases)
3. Weight accepting 0 and negative values, any chars (Solved + Added test cases)
4. Parcels#update throws an error, when any validation fails (Solved + Added test cases)
5. while creating parcel sender and receiver cannot be the same, backend validation (Solved + Added test cases)
6. Mobile Number validation (Solved + Added test cases)
7. Email validation (Solved + Added test cases)
8. Cant update users (Solved)
9. User destroy feature should be implemented as one of the below
   1. Should not be able to destroy user if any parcel exists for this user 
   2. implement is_deactivated for user table (Implemented this solution from a better product perspective)
      1. If any user is deactivated and the user has many parcels, then all the parcels will show (Deactivated) text in the sender/receiver column
   3. implement dependent_destroy

#### Took 4 hours to complete all the above issues

1. Create tracking id feature for every parcel 
    1. Send mail feature
2. Search via tracking id


## Additional Issues
1. Editing parcel should not be able to change sender and receiver