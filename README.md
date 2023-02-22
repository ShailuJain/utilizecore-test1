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
1. Cost accepting 0 and negative values, any chars (Solved)
2. Cost presence check (Solved)
3. Weight accepting 0 and negative values, any chars (Solved)
4. Parcels#update throws an error, when any validation fails (Solved)
5. while creating parcel sender and receiver cannot be the same, backend validation (Solved)
6. Mobile Number validation (Solved)
7. Email validation (Solved)
8. Cant update users (Solved)
9. User destroy feature should be implemented as one of the below (Solved with point 2)
   1. Should not be able to destroy user if any parcel exists for this user 
   2. implement is_deactivated for user table **(Implemented this solution from a better product perspective)**
      1. If any user is deactivated and the user has many parcels, then all the parcels will show (Deactivated) text in the sender/receiver column
   3. implement dependent_destroy 
10. Create tracking id feature for every parcel  (Solved)
    1. Send mail feature (no smtp server setup)
11. Search via tracking id (Solved)
12. N+1 query problem in List addresses (Solved)
13. N+1 query problem in List parcel (Solved)
14. Fixed all the testcases and updated exsiting and added new cases


## Enhancements
1. Sign Up/Login module (Done)
   1. Authorization module for admin only actions (is_admin column)
   2. Other user actions
2. Search parcel should be publicly accessible


## Additional Issues
1. Editing parcel should not be able to change sender and receiver
2. search feature in sender and receiver id while creating parcel, so that all the user will not be directly listed
3. Pagination can be applied on all listing pages
4. Additional bugs might have introduced by adding features
