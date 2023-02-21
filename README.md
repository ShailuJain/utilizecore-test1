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
5. while creating parcel sender and receiver cannot be the same, backend validation
6. Mobile Number validation
7. Cant update users
8. User destroy feature should be implemented as one of the below
   1. Should not be able to destroy user if any parcel exists for this user 
   2. implement is_deactivated for user table
   3. implement dependent_destroy
9. Create tracking id feature for every parcel 
   1. Send mail feature
10. Search via tracking id
