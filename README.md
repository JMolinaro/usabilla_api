#Installation

You can add it to your Gemfile with:
```
gem 'usabilla_api'
```
Run the bundle command to install it.

#Configuration

######Add these lines to the appropriate config/environments file
(Access & Secret Key are required)
```
UsabillaApi.configuration.access_key = 'YOUR-ACCESS-KEY'
UsabillaApi.configuration.secret_key = 'YOUR-SECRET-KEY'
```
Change 'YOUR-ACCESS-KEY' & 'YOUR-SECRET-KEY' to appropriate values.

Get your access and secret key here: [Usabilla Member API](https://usabilla.com/member/api)

You can either return an Object (default) or a JSON by including and changing the value of the following configuration option;
```
UsabillaApi.configuration.json_response = true
```

#Usage

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
