1. Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend.

2. Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend.
The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page.

3. Must use your Rails API and a form to create a resource and render the response without a page refresh.

4. Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype.

Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.



Specifications for the Rails with jQuery Assessment

Specs:

1.    Use jQuery for implementing new requirements
2.    Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
3.    Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
4.    Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
5.    Include at least one link that loads or updates a resource without reloading the page.
6.    Translate JSON responses into js model objects.
7.    At least one of the js model objects must have at least one method added by your code to the prototype.

Confirm

1.    You have a large number of small Git commits
2.    Your commit messages are meaningful
3.    You made the changes in a commit that relate to the commit message
4.    You don't include changes in a commit that aren't related to the commit message
