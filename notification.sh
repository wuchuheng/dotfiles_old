#!/bin/sh

notificationUrl="https://wuchuheng.com/query"

function curlNotification() {
	echo $1
	curl --location --request POST $notificationUrl \
--header 'Content-Type: application/json' \
--data-raw "{
    \"query\": \"mutation (\$input:NewMessage!){\n  createMessage(input:\$input) {\n\t\tid,\n    title,\n    content\n  }\n}\",
    \"variables\": {
        \"input\": {
            \"title\": \"${1}\",
            \"content\": \"content\"
        }
    }
}"

}

function wegetNotification() {
	wget --no-check-certificate --quiet \
  --method POST \
  --timeout=0 \
  --header 'Content-Type: application/json' \
  --body-data "{
    \"query\": \"mutation (\$input:NewMessage!){\n  createMessage(input:\$input) {\n\t\tid,\n    title,\n    content\n  }\n}\",
    \"variables\": {
        \"input\": {
            \"title\": \"${1}\",
            \"content\": \"content\"
        }
    }
}" \
   $notificationUrl

}

function n() {
  title=$1
  if [[ -z $title ]]; then
    title="ok"
  fi

	isCurl=`command -v curl`
	isCommand=`command -v wget`
	if [[ ! -z isCurl  ]]; then
		curlNotification $title;
	elif [[ ! -z isCommand ]]; then
		wegetNotification $title
	else
		echo "No curl or weget tool"
	fi

}




