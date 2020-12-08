# test-android-bdd
## Description
Automated test for __Unit Converter app__

* Test engine: `cucumber`
* Test driver: `appium`
* Test client: `android`
* Language: `ruby`

## Setup environment on Windows
### Installation
1. Install Ruby by [RubyInstaller (WITH DEVKIT option)](https://rubyinstaller.org/downloads/), as cucumber's step definitions and hooks were written in Ruby.
1. Install [Appium Desktop](http://appium.io/). Click download and select _Appium-windows-version.exe_.
Alternatively, you may install [appium](https://www.npmjs.com/package/appium) directly from NPM provided you already have Nodejs installed.

        npm install -g appium
        appium
1. Install Ruby libraries [_appium_lib_](https://rubygems.org/gems/appium_lib) and [_cucumber_](https://rubygems.org/gems/cucumber) from command line

        gem install appium_lib
        gem install cucumber

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
     <sup>ANDROID_SWT  | <sup>%ANROID_HOME%\tools\lib\x86_64 |
     <sup>JAVA_HOME    | <sup>C:\Program Files\Java\jre1.8.0_202 |

1. Add the following paths to system variable PATH:

    * %ANDROID_HOME%\tools
    * %ANDROID_HOME%\tools\bin
    * %ANDROID_HOME%\platform-tools

:sunglasses: 
TIPS: In any case, if you need to modify the above configuration during the test please restart appium server to pick up the changes!

## Run test
1. Start virtual device
1. Launch Appium and start server
1. Launch windows command prompt, navigate to the test-android-bdd project folder and run command:
    * To run all scenarios: 
        
            cucumber --publish-quiet

    * To run test scenarios with tags (e.g. tag @default)

            cucumber -t @default --publish-quiet

1. Test result will be shown on command prompt. Use --publish option instead to publish to cucumber report

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