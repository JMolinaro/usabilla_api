Version History
====
    * All version update notes will be included here.
----

* **1.1.1** Clean up JSON.parse.
* **1.1.0** Removed json response flag as it is unnecessary for Rails/Sinatra integration. Simply adding .to_json on a proper json respond_to will yield the same results.
* **1.0.1** Adjust Query String for proper routing.
* **1.0.0** 100% Testing Included. Refactoring to the way you call convenience functions has changed, you must now change
        your previous function calls to what has been updated in the [Readme file](https://github.com/JMolinaro/usabilla_api/blob/master/README.md) under Usage.
