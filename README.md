# test-android-bdd
Automate test for __Unit Converter app__

* Test engine: cucumber
* Test driver: appium
* Test client: android virtual device, created and run from Genymotion android emulator.

## Installation
* Install Ruby. Cucumber's step definitions and hooks were written in Ruby.
* Install gems _appium_lib_ and _cucumber_ from commandline

        gem install appium_lib
        gem install cucumber
* Install Appium
* Install [Android Studio and SDK](https://developer.android.com/studio#downloads), which includes the adb commandline tool
* Install Genymotion android emulator, or use the one provided in Android Studio.

## Run from command line
Run all scenarios: 
        
        cucumber

Run test with tags (e.g. tag @default)

        cucumber -t @default