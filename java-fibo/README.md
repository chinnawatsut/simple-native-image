# GraalVM Community Edition
https://www.graalvm.org/downloads/

`sudo xattr -r -d com.apple.quarantine <jdk-dir>`


# Oracle GraalVM
https://www.oracle.com/java/technologies/downloads/#graalvmjava17

`sudo xattr -r -d com.apple.quarantine <jdk-dir>`

## JIT
`javac Fibo.java`

`java Fibo`

## Native Image
`native-image Fibo`

## Native Image with Profile Guided
`native-image --pgo-instrument Fibo`

`./fibo`

`native-image --pgo=default.iprof Fibo`