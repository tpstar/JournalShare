1. Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend.

2. Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend.
The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page.

3. Must use your Rails API and a form to create a resource and render the response without a page refresh.

4. Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype.

Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.
