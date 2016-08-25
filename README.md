# GLBRC assignment
Details for assignment found in word doc

# Story
Alice logs into the application for the first time, and sees a page containing graphic links (shapes) to other programs.  In a fully fleshed-out program, these links would take the user to the other apps they represent by clicking on them.  In this exercise, they merely need to be present. The programs Alice sees on her first visit to the site are the ones shown to new users by default.  

Alice can customize the programs that are shown to her by selecting not to see one or more programs that are currently showing, and by adding other programs from a list of available applications.  When 
Alice makes a change to her available programs, the display updates to show the changed selections.  Any changes Alice makes persist to subsequent sessions.

# Program Structure and Details
* There is only one main application page, the home page, which users see after they log into the application.  This page shows a collection of graphic icons that link to other available programs.
* You need to provide a user login functionality. Please use existing library or other package that allow you to implement this functionality quickly. We are not worried about security right now.
* You do NOT need to create an interface for creating or maintaining user records.  Just generate the three sample users described in User table description (below) by some easy means.
* Provide functionality to display all available applications not currently on the user's home page when the user selects “Add App”.  Allow the user to select one or more of the listed apps to add to their home page.
* Similarly, there should be a way for users to remove apps from their home pages.
* Application table should have attributes for Name, Description, Color, DefaultStatus
* User table should have user login and password attributes
* The applications a user sees should be determined by a User-Apps link table.
* Each link to a program includes the name and description of the program to which it links.
