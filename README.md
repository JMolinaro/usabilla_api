#Installation

You can add it to your Gemfile with:
```
gem 'usabilla_api'
```
Run the bundle command to install it.

#Configuration

######Add these lines to the appropriate config/environments file
Access & Secret Key are required
```
UsabillaApi.configuration.access_key = 'YOUR-ACCESS-KEY'
UsabillaApi.configuration.secret_key = 'YOUR-SECRET-KEY'
```
Change 'YOUR-ACCESS-KEY' & 'YOUR-SECRET-KEY' to appropriate values.

Get your access and secret key here: [Usabilla Member API](https://usabilla.com/member/api)

You can either return an Object (default) or a the original JSON string.
```
UsabillaApi.configuration.json_response = true
```
Full Usabilla API documentation: [Usabilla API](https://usabilla.com/api)

#Usage

Simply add one of the following;
(params = url query paramaters)

To get the **buttons** api response
```
UsabillaApi.button.retrieve(params)
```
To get the **buttons feedback** items api response
```
UsabillaApi.button.feedback(params)
```
To get the **campaign** api response
```
UsabillaApi.campaign.retrieve(params)
```
To get the **campaign results** api response
```
UsabillaApi.campaign.results(params)
```

######Example
```
# Controller /button_controller.rb
def show
  @buttons = UsabillaApi.button(params)
end
```
```
# View /show.html.rb
<h2>Buttons</h2>
<% @buttons.each do |button| %>
  Button ID: <% button.id %>
  Button Name: <% button.name %>
<% end %>
```

######Accepted Query String Parameters

Usabilla excepts the following query string parameters as values;

Returns the requested subset.
```
?limit=
```
Returns the requested subset.
```
?since= 
```
Note: Only accepts Unix Timestamps

#Contributing
Feel free to fork or branch and create pull requests with any changes or cool additions!
Be sure to test any changes and include them in the pull request in order for it to be considered.

Thanks!


######TODO
* Refactoring

*isn't this always the case though?* ~_^
