## Automated tests for Unit Convertor History feature
In this repository you will find my mobile automated test scenarios of the history feature in Unit Convertor.
Unit Convertor is a native android app. When user runs a unit conversion, such as converting a value from cm to inch, 
a conversion history is added. 
 The test automation handles different swipe actions. Examples include opening the main menu by swiping from 
 left to right and finding the desired conversion in the main menu by swiping up and down. 

* Test engine: `cucumber`
* Test driver: `appium`
* Test client:as `android`
* Language: `ruby`

### Demo scenario
* Run enough conversions to build up the history.
* Then swipe upwards to reach and retrieve the conversion at the bottom of the history.

![screenshot](https://github.com/candkyng/test-android-bdd/blob/main/demo/history_scroll.gif)

### Demo test report
![screenshot](https://github.com/candkyng/test-android-bdd/blob/main/demo/report.png) 

## Setup test environment on Windows
### Installation
1. Install Ruby by [RubyInstaller (WITH DEVKIT option)](https://rubyinstaller.org/downloads/)
1. Install [Appium Desktop](http://appium.io/). Click download and select _Appium-windows-version.exe_.
Alternatively, you may install [appium](https://www.npmjs.com/package/appium) directly from NPM provided you already have Nodejs installed.

        npm install -g appium
        appium
1. Install Ruby libraries [_appium_lib_](https://rubygems.org/gems/appium_lib), [_cucumber_](https://rubygems.org/gems/cucumber) and [_minitest_](https://rubygems.org/gems/minitest) from command line

        gem install appium_lib
        gem install cucumber
        gem install minitest

    If you already have these libraries installed at an older version, uninstall them using `gem uninstall` command and reinstall them using the same command as above to install the latest version.

1. Install [Java SE 8 from Oracle](https://www.oracle.com/ca-en/java/technologies/javase/javase-jdk8-downloads.html)
1. Install [Android Studio and SDK](https://developer.android.com/studio#downloads), which includes the adb commandline tool
1. (Optional) Install [Genymotion android emulator](https://www.genymotion.com/download/) to test on virtual devices which are not included in Google Android Studio. 
Choose _without VirtualBox_ option only if you already have _Oracle VM VirtualBox_ installed.
1. (Optional) Install [appium-doctor](https://github.com/appium/appium-doctor) to verify appium configuration. This is useful for diagnose common configuration issues.

### Configuration
1. Create the following environment variables:

     Variable    | Value |
     :------     |:---   |
     <sup>ANDROID_HOME | <sup>C:\Users\\<_USER_\>\AppData\Local\Android\Sdk |
     <sup>ANDROID_SWT  | <sup>%ANDROID_HOME%\tools\lib\x86_64 |
     <sup>JAVA_HOME    | <sup>C:\Program Files\Java\jre1.8.0_202 |

1. Add the following paths to system variable PATH:

    * %ANDROID_HOME%\tools
    * %ANDROID_HOME%\tools\bin
    * %ANDROID_HOME%\platform-tools

:sunglasses: 
TIPS: In any case, if you need to modify the above configuration during the test please restart appium server to pick up the changes!

## Run test
1. Start virtual device (See Wiki page _Start a virtual device_ for more detail)
1. Launch Appium and start server
1. Launch windows command prompt, navigate to the test-android-bdd project folder and run test with history profile:

    * To run history scenarios: 
        
            cucumber -p history
    
1. Cucumber profiles are configured in _cucumber.yml_ file.
1. Test result will be generated in report.html and on command prompt.

## FAQ:    
#### How to remove ANSICON warning and get coloured output:         
Caution: Installing ANSICON may cause adb command not to work. However, you can always uninstall ANSICON if any issue occurs
When running the test if you see a warning regarding ANSICON, you may follow the steps below to get coloured output on command prompt:     
1. Get ANSICON package from https://github.com/adoxa/ansicon/downloads
1. Unzip it to a local folder. 
1. On command prompt, navigate to x86 or x64 folder depending on whether your windows client is 32 bit or 64 bit
1. Run the following to install ANSICON
        
            ansicon.exe –i
1. Use this command to uninstall ANSICON if issue occurs

            ansicon.exe –u3
