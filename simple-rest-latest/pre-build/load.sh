#!/bin/bash

times=${1:-1000}

# Display options to the user
echo "Select an option:"
echo "1 - native"
echo "2 - native-h2"
echo "3 - native-ob -  optimize for fastest build time"
echo "4 - run_jar"
echo "5 - run_generated_jar"
echo "6 - native-o2 - aggressive optimizations"
echo "7 - native-o3 - all optimizations for best performance"

read -p "Enter your choice (1/2/3/4/5): " choice

# Initialize the command variable
command=""
image=""
# Determine the command based on user's choice
case $choice in
    1)
        command="./start.sh native"
        image="native"
        ;;
    2)
        command="./start.sh native-h2"
        image="native-h2"
        ;;
    3)
        command="./start.sh native-ob"
        image="native-ob"
        ;;
    4)
        command="./start.sh jar"
        image="jar"
        ;;
    5)
        command="./start.sh generated-jar"
        image="generated-jar"
        ;;
    6)
        echo "😈 aggressive optimizations"
        command="./start.sh native-o2"
        image="native-o2"
        ;;
    7)
        echo "all optimizations for best performance"
        command="./start.sh native-o3"
        image="native-o3"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Change directory
cd "/Users/chinwat/Workspace/kbtg/graalvm-native-image/simple-rest-latest/pre-build"
echo "Changed directory to /Users/chinwat/Workspace/kbtg/graalvm-native-image/simple-rest-latest/pre-build"

# Execute the stored command
eval $command & echo "Executing command: $command"

# Rest of the script remains the same
while [ "$(curl -s -o /dev/null -L -w '%{http_code}' http://localhost:8080/api/hello)" != "200" ]; do
    sleep 0.1
done
echo "Application has started."

export APP_PID=$(lsof -ti :8080)
echo "Application PID captured: $APP_PID"

psrecord $APP_PID --plot "./plots/${image}_${times}_$(date +%s).png" --include-children &
echo "Recording process statistics..."

echo "Simulating load on the application..."
for i in $(seq 1 $times); do
    curl -s -o /dev/null -L http://localhost:8080/api/hello
#     sleep 0.001
done
echo "Load simulation completed."

echo "Stopping the application..."
kill $APP_PID

echo "Waiting for all background processes to finish..."
wait
echo "Script execution completed."
