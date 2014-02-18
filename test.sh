xctool -workspace IntroToiOS.xcworkspace \
       -scheme IntroToiOSTests \
       -sdk iphonesimulator \
       clean build test \
       ONLY_ACTIVE_ARCH=NO
