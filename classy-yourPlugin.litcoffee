Example Classy plugin
=====================

This is a heavily commented Angular Classy plugin.
Hopefully this will help explain how to write your own Classy plugin.

If anything isn't completely clear then open an issue on GitHub and I will try to help
you out.


Plugin Definition
-----------------

To create a plugin you need to include the `classy-core` module and then pass
your plugin object into the `class.plugin.controller function`.

    angular.module('classy-yourPlugin', ['classy-core']).classy.plugin.controller

      name: 'yourPlugin'

The localInject Array
---------------------

Dependencies placed in the localInject array will be available on `@` (`this`)
in the plugins init and postInit methods.
They will not be visible in the controller

      localInject: ['$timeout']

Configurable Plugin Options
---------------------------

Configurable options are placed here.
Classy will check if the user has over-rided any options and make them available
on `@` (`this`). By convention you should include an `enabled` property so that
the user can enable and diable your plaugin easily

      options:
        enabled: true
        foo: 'bar'
        noOfSecondsToWait: 5


The `preInit` Phase
-------------------

The `preInit` function will be called before the class has been initialised by Angular.

(You can also use `preInitBefore` and `preInitAfter`, these have the same arguments as `preInit`
but they are called before and after the `preInit` function.)

      preInit: (classConstructor, classObj, module) ->

Available arguments:
  * `classConstructor` is the Classy Controller constructor function, this
    is the function that will be initialised by ngController, it is
    available in the init and postInit functions using `klass.constructor`
  * `classObj` is the raw object that is passed into the app.classy.controller()
  * `module` is a reference to the app module

        console.log(classConstructor.name, classObj.name, @name)
        # -> 'classyController', 'TodoCtrl', 'yourPlugin'

`@` or (`this`) provides access to local functions, it also provides access
to the compiled options object (i.e. it will include any setting overrides
that the user does).

        @doSomething(@options.foo) # Display's an alert box saying 'Hello World!'

Dependencies from the `localInject` array are not available on `@` (`this`)
in `preInit` but they are available in `init` and `postInit`

        console.log(@$timeout) # -> undefined

      doSomething: (input) ->
        if input is 'bar'
          alert('Hello World!')


The `init` Phase
----------------

The `init` function will be called after the class has been initialised by Angular
but before the controller's `init` (klass.init) method is called.

(You can also use `initBefore` and `initAfter`, these have the same arguments as `init`
but they are called before and after the `init` function.)

      init: (klass, deps, module) ->

Available arguments:
  * `klass` is the controller class and all of it's properties, you can also
    access the dependencies from here but it's best to use `deps` instead
    because if named dependencies are used then they may have an unexpected name
  * `deps` is an object map containing all of the controller's dependencies
  * `module` is a reference to the app module

If you want to check that the controller has injected the `$scope` then do
something like the following:

        if !deps.$scope
          throw new Error "You need to inject `$scope` to use this plugin"

Return values are ignored in init *except* when it's a promise.

If a promise is returned then Classy will wait for it to be resolved before
the klass.init function is called. In the example below, Classy will wait 5 seconds
before resolving the `init` phase.

        return @waitNoOfSeconds(@options.noOfSecondsToWait)

`@$timeout` is available below because it was defined in the `localInject` Array
(the `init` phase has access to dependencies defined in the `localInject` array).

      waitNoOfSeconds: (noOfSeconds) ->
        noOfMs = noOfSeconds * 1000
        return @$timeout ->
          true
        , noOfMs


The `postInit` Phase
--------------------

This function is exectuted immediately after `klass.init()`

(You can also use `postInitBefore` and `postInitAfter`, these have the same arguments as `postInit`
but they are called before and after the `postInit` function.)

      postInit: (klass, deps, module) ->

Available arguments are the same as the `init` phase, return value is ignored.
