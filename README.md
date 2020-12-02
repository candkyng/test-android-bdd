# test-android-bdd
## Description
Automate test for __Unit Converter app__

* Test engine: cucumber
* Test driver: appium
* Test client: android virtual device, created and run from Genymotion android emulator.

## Setup environment on Windows
### Installation
1. Install Ruby by [RubyInstaller (WITH DEVKIT option)](https://rubyinstaller.org/downloads/). Cucumber's step definitions and hooks were written in Ruby.
1. Install gems _appium_lib_ and _cucumber_ from command line

        gem install appium_lib
        gem install cucumber
1. Install [Appium](http://appium.io/). Click download and select _Appium-windows-<version>.exe_
1. Install [Android Studio and SDK](https://developer.android.com/studio#downloads), which includes the adb commandline tool
1. (Optional) Install [Genymotion android emulator](https://www.genymotion.com/download/) to test on virtual devices which are not included in Google Android Studio. 
Choose _without VirtualBox_ option only if you already have _Oracle VM VirtualBox_ installed.
1. (Optional) Install [appium-doctor](https://github.com/appium/appium-doctor) to verify appium configuration. This is useful for diagnose common configuration issues.

### Configuration
1. Create the following environment variables:

     Variable    | Value |
     :------      |:---|
     <sup>ANDROID_HOME | <sup>C:\Andriod-Sdk |
     <sup>JAVA_HOME    | <sup>C:\Program Files\Java\jre1.8.0_202 |

1. Add the following paths to system variable PATH:

    * %ANDROID_HOME%\tools
    * %ANDROID_HOME%\tools\bin
    * %ANDROID_HOME%\platform-tools

 :sunglasses: 
TIPS: In any case, if you need to modify the above configuration during the test please restart appium server to pick up the changes!

## Run test
1. Launch Appium and start server

1. Launch windows command prompt, run command:
    * To run all scenarios: 
        
            cucumber

    * To run test scenarios with tags (e.g. tag @default)

            cucumber -t @default