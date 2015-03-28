#Getting started

You can add it to your Gemfile with:
```
`gem 'usabilla_api'
```
Run the bundle command to install it.

#Configuration Options

Add these lines to the appropriate config/environments file;

(Access & Secret Key are required)
```
# Get your access and secret key here: https://usabilla.com/member/api
# Change 'YOUR-ACCESS-KEY' & 'YOUR-SECRET-KEY' to appropriate values.
UsabillaApi.configuration.access_key = 'YOUR-ACCESS-KEY'
UsabillaApi.configuration.secret_key = 'YOUR-SECRET-KEY'
```
You can either return an Object or a JSON by including and changing the value of the following configuration option;
```
# To have the gem return json instead of an object use the following.
UsabillaApi.configuration.json_response = false
```

#Example Usage

In a Controller, simply add one of the following;
```
# To get the buttons api response
@button = UsabillaApi.button(params)

# To get the buttons feedback items api response
@feedback_items = UsabillaApi.feedback_items(params)

# To get the campaign api response
@campaign = UsabillaApi.campaign(params)

# To get the campaign results api response
@campaign_results = UsabillaApi.campaign_results(params)
```
