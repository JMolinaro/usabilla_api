#Installation

You can add it to your Gemfile with:
```
gem 'usabilla_api'
```
Run the bundle command to install it.

[Example Rails App](https://github.com/JMolinaro/usabilla_api_example)

[gem usabilla_api](https://rubygems.org/gems/usabilla_api/)

#Configuration

######Add these lines to the appropriate config/environments file
Access & Secret Key are required
```
UsabillaApi.configuration.access_key = 'YOUR-ACCESS-KEY'
UsabillaApi.configuration.secret_key = 'YOUR-SECRET-KEY'

#Change 'YOUR-ACCESS-KEY' & 'YOUR-SECRET-KEY' to appropriate values.
```
Get your access and secret key here: [Usabilla Member API](https://usabilla.com/member/api)

Full Usabilla API documentation: [Usabilla API](https://usabilla.com/api)

#Usage

Simply add one of the following;
(params = url query paramaters)

####Apps API Requests
**App**
```
UsabillaApi.apps_app.retrieve(params)
```
**Feedback**
```
UsabillaApi.apps_feedback.retrieve(params)
```

**Campaign Results**
```
UsabillaApi.apps_campaign_results.retrieve(params)
```

####Email API Requests
**Buttons**
```
UsabillaApi.email_button.retrieve(params)
```
**Feedback**
```
UsabillaApi.email_feedback.retrieve(params)
```

#### Websites API Requests
**Buttons**
```
UsabillaApi.websites_button.retrieve(params)
```
**Feedback**
```
UsabillaApi.websites_feedback.retrieve(params)
```
**Campaign**
```
UsabillaApi.websites_campaign.retrieve(params)
```
**Campaign Results**
```
UsabillaApi.websites_campaign_results.retrieve(params)
```
**Campaign Statistics**
```
UsabillaApi.websites_campaign_stats.retrieve(params)
```

######Example
```
# Controller /button_controller.rb
def show
  @buttons = UsabillaApi.websites_button.retrieve(params)
end
```
```
# View /show.html.erb
<h2>Buttons</h2>
<% @buttons.items.each do |button| %>
  Button ID: <%= button.id %>
  Button Name: <%= button.name %>
<% end %>
```
[Example Rails App](https://github.com/JMolinaro/usabilla_api_example)

######Accepted Query String Parameters

Usabilla excepts the following query string parameters as values;

Returns the requested subset limit.
```
?limit=
```
Returns the requested subset since Unix Timestamps In Milliseconds.
```
?since= 
```
Returns the requested subset of the days since this amount. (Overrides 'since' param)
```
?days_ago= 
```

#Contributing
Feel free to fork or branch and create pull requests with any changes or cool additions!
Be sure to test any changes and include them in the pull request in order for it to be considered.

Thanks!


######Updates

Please refer to the [Changelog](https://github.com/JMolinaro/usabilla_api/blob/master/CHANGELOG.md) for update information.
