# Classy Plugin Example

This is an example Angular Classy plugin with lots of guidelines and comments. Take a look at the source for either the [javascript version](https://github.com/davej/classy-plugins/blob/master/classy-yourPlugin.js) or the [(literate) Coffeescript version](https://github.com/davej/classy-plugins/blob/master/classy-yourPlugin.litcoffee).

If you want to see a real-world example of a Classy plugin then check out the [`classy-computed` repo](https://github.com/davej/classy-computed).

## Writing your own Classy plugin

### The Classy Controller Lifecycle

![The Classy Controller Lifecycle](http://davej.github.io/angular-classy/images/lifecycle.png)

It's worth familiarising yourself with Classy's controller lifecycle before you write a plugin. Take a look at the plugin template in [javascript](https://github.com/davej/classy-plugins/blob/master/classy-yourPlugin.js) or [coffeescript](https://github.com/davej/classy-plugins/blob/master/classy-yourPlugin.litcoffee) to get better acquainted, but here's a brief synopsis.

#### `preInit`

This is immediately after you define your controllers with `app.classy.controller()`.

#### `init`

This is when the controller get instantiated (usually with `ng-controller="MyController"`).

#### `postInit`

This is after the Classy controller's `init()` method has been executed.

### Notes

Coffeescript or Javascript is fine (or anything that compiles to javascript for that matter). If using Coffeescript then please include the compiled javascript along with the source files. Optionally you may also want to include a minified version of the source. Feel free to depend on a build tool like gulp or grunt for building your source.

The command to run your build should be added to [`scripts.start` in your `package.json`](https://www.npmjs.org/doc/misc/npm-scripts.html).

Make sure you include an examples directory which includes at least one example of using your plugin. I also like to use my example controllers as controllers for my test.

### Testing

It is up to you how much testing you wish to do and how you would like to test your plugin. I use [Karma](http://karma-runner.github.io/) with the [Jasmine testing framework](http://jasmine.github.io/) and use [Travis](https://travis-ci.org/) to run the tests automatically when I push new code.

The approach that I like to take is to write a controller that uses classy with my plugin, I then test the resultant controller. This is a bit unconventional but I have found it to work quite well for me. Remember if you decide to only unit test the plugin directly then your tests won't cover any interactions with Angular controllers and Angular Classy.

The command to run your tests should be added to [`scripts.test` in your `package.json`](https://www.npmjs.org/doc/misc/npm-scripts.html).

### Naming your plugin

You can name your plugin whatever you like but for the module name you should follow the format of `classy.myPluginName`. 

### Registering your plugin

Ensure that your bower.json has the keyword of 'classy-plugin', this will make it discoverable as an Angular Classy plugin and it will appear on the Classy website. Ensure that Angular Classy is specified as a dependency of your plugin.

Register your plugin on Bower with: `bower register <my-package-name> <git-endpoint>`

camelCase and dots (.) are not allowed on the bower registry so I use dashes instead: e.g. `classy.myPluginName -> classy-my-plugin-name`.


### Your Plugin TODO list

1. Create Github repo for your plugin
2. Write your plugin
3. Do an example(s) of your plugin in use
3. Write tests for your plugin (optional but recommended)
4. Create bower.json and package.json
5. Setup travis automated tests (optional)
6. Write a readme
7. Register you package with bower: `bower register <my-package-name> <git-endpoint>`

