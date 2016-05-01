# To Pass the assessment
add to controllers
before_filter :authenticate_user!

You don't need to add every possible validation or duplicates,
such as presence and a minimum length,
but the models should defend against invalid data.

make nested forms that writes to an associated model through
a custom attribute writer.
New Deal Form that allows you to add services
Show all deals that include specified service
deal[service_attributes][0][title]
deal[service_attributes][0][price]
should write to the deal model with `service_attributes=`

This method cannot be provided via the accepts_nested_attributes_for macro
because the custom writer would be responsible for finding or creating a recipe by name
and then creating the row in the join model deal_services with the deal_id, the service_id, and the description from the form.

Deal.by_largest_discount
Deal.by_total_value_descending
Deal.by_largest_discount.by_beauty_place(beauty_place)

make sure devise works
turn on omniauth

Your forms should correctly display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view.

Your views should use helper methods and partials to be as logic-less as possible.

BeautyPlace.deals.published
Make a Cart for Deals
user has deals through purchased_deals
user.deals.expired

# My wants
a user should be able to make an appointment with an employee
from a beauty place show page.

create partial sub_heading
add helper-bar to sub_heading
move _nav _search to partials
render _nav in sub_heading
change helper-bar to sub-nav

change normal user to customer

#Flow
normal user

post to search action
<!-- POST '/deals/results' -->
list all deals by state

if owner
select beauty_place
add services with price
select discount
save deal
publish deal

if admin
list all beauty places alphabetically
create, edit, update, publish, delete buttons
