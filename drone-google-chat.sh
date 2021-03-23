#!/bin/bash

if [ -z $PLUGIN_URL ]; then 
  echo "Missing URL under settings config"
  exit 1
fi

if [ -z ${PLUGIN_KEY} ]; then 
  echo "Missing KEY under settings config"
  exit 1
fi

if [ -z ${PLUGIN_TOKEN} ]; then 
  echo "Missing TOKEN under settings config"
  exit 1
fi

if [ -z $PLUGIN_IMAGE ]; then
  PLUGIN_IMAGE="https://orders.mcsteen.com/images/chat-logo.png"
fi

if [ -z $DRONE_COMMIT_MESSAGE ]; then
  DRONE_COMMIT_MESSAGE="unknown"
fi

if [ -z $DRONE_COMMIT_AUTHOR ]; then
  PLUGIN_IMAGE="unknown"
fi

if [ -z $DRONE_COMMIT_BRANCH ]; then
  PLUGIN_IMAGE="unknown"
fi

generate_post_data()
{
  cat <<EOF
{
  "cards": [
    {
      "header": {
        "title": "#$DRONE_BUILD_NUMBER - $DRONE_REPO_NAME",
        "subtitle": "last commit: $DRONE_COMMIT_MESSAGE",
        "imageUrl": "$PLUGIN_IMAGE",
      },
      "sections": [
        {
          "widgets": [
            {
              "keyValue": {
                "topLabel": "Status",
                "content": "<font color=\"#ff0000\">$DRONE_BUILD_STATUS</font>"
              }
            },
            {
              "keyValue": {
                "topLabel": "Author",
                "content": "$DRONE_COMMIT_AUTHOR"
              }
            },
            {
              "keyValue": {
                "topLabel": "Branch",
                "content": "$DRONE_COMMIT_BRANCH"
              }
            },
          ]
        },
        {
          "widgets": [
              {
                  "buttons": [
                    {
                      "textButton": {
                        "text": "Github",
                        "onClick": {
                          "openLink": {
                            "url": "$DRONE_COMMIT_LINK"
                          }
                        }
                      }
                    },
                    {
                      "textButton": {
                        "text": "Drone",
                        "onClick": {
                          "openLink": {
                            "url": "$DRONE_BUILD_LINK"
                          }
                        }
                      }
                    }
                  ]
              }
          ]
        }
      ]
    }
  ]
}
EOF
}

curl --silent --location --request POST \
  --header 'Content-Type: application/json' \
  --data "$(generate_post_data)" "${PLUGIN_URL}?key=${PLUGIN_KEY}&token=${PLUGIN_TOKEN}"