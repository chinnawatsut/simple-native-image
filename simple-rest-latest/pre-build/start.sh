#!/bin/bash
cd "/Users/chinwat/Workspace/kbtg/graalvm-native-image/simple-rest-latest"

# Check the first argument provided to the script
case "$1" in
  build-native)
    ./gradlew clean nativeCompile
    ;;
  build-jar)
    ./gradlew clean build
    ;;
  native)
    ./pre-build/simple-rest-latest
    ;;
  native-h2)
    ./pre-build/simple-rest-latest-h2
    ;;
  native-ob)
    ./pre-build/simple-rest-latest-ob
    ;;
  native-o2)
    ./pre-build/simple-rest-latest-o2
    ;;
  native-o3)
    ./pre-build/simple-rest-latest-o3
    ;;
  jar)
    java -jar ./pre-build/simple-rest-latest-0.0.1-SNAPSHOT.jar
    ;;
  generated-jar)
    java -jar ./build/libs/simple-rest-latest-0.0.1-SNAPSHOT.jar
   ;;
  *)
    echo "Usage: $0 {build-native|build-jar|native|native-h2|native-ob|jar|generated-jar}"
    exit 1
    ;;
esac
