# Classy Plugin Example

This is an example Angular Classy plugin with lots of guidelines and comments. Take a look at the source for either the [javascript version](https://github.com/davej/classy-plugins/blob/master/classy-yourPlugin.js) or the [(literate) Coffeescript version](https://github.com/davej/classy-plugins/blob/master/classy-yourPlugin.litcoffee).

If you want to see a real-world example of a Classy plugin then check out the [`classy-computed` repo](https://github.com/davej/classy-computed).

## Writing your own Classy plugin

### Notes

Coffeescript or Javascript is fine (or anything that compiles to javascript for that matter). If using Coffeescript then please include the compiled javascript along with the source files. Optionally you may also want to include a minified version of the source. Feel free to depend on a build tool like gulp or grunt for building your source. I like double-spaced indentation but use whatever you like.

Make sure you include an examples directory which includes at least one example of using your plugin. I also like to use my example controllers as controllers for my test.

### Testing

It is up to you how much testing you wish to do and how you would like to test your plugin. I use [Karma](http://karma-runner.github.io/) with the [Jasmine testing framework](http://jasmine.github.io/) and use [Travis](https://travis-ci.org/) to run the tests automatically when I push new code.

The approach that I like to take is to write a controller that uses classy with my plugin, I then test the resultant controller. This is a bit unconventional but I have found it to work quite well for me. Remember if you decide to only unit test the plugin directly then your tests won't cover any interactions with Angular controllers and Angular Classy.

The command to run your tests should be added to `scripts.test` in your `package.json`.

### Registering your plugin

You can name your plugin whatever you like but I suggest that you follow the format of classy-myPluginName. Ensure that your bower.json has the keyword of 'classy-plugin', this will make it discoverable as an Angular Classy plugin. Ensure that Angular Classy is specified as a dependency of your plugin.

Register your plugin on Bower with: `bower register <my-package-name> <git-endpoint>`


### Your Plugin TODO list

1. Create Github repo for your plugin
2. Write your plugin
3. Do an example(s) of your plugin in use
3. Write tests for your plugin (optional but recommended)
4. Create bower.json and package.json
5. Setup travis automated tests (optional)
6. Write a readme
7. Register you package with bower: `bower register <my-package-name> <git-endpoint>`

