#!bin/bash

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

generate_post_data()
{
  cat <<EOF
{
  "cards": [
    {
      "header": {
        "title": "Pizza Bot Customer Support",
        "subtitle": "pizzabot@example.com",
        "imageUrl": "https://goo.gl/aeDtrS"
      },
      "sections": [
        {
          "widgets": [
              {
                "keyValue": {
                  "topLabel": "Order No.",
                  "content": "12345"
                  }
              },
              {
                "keyValue": {
                  "topLabel": "Status",
                  "content": "In Delivery"
                }
              }
          ]
        },
        {
          "header": "Location",
          "widgets": [
            {
              "image": {
                "imageUrl": "https://maps.googleapis.com/..."
              }
            }
          ]
        },
        {
          "widgets": [
              {
                  "buttons": [
                    {
                      "textButton": {
                        "text": "OPEN ORDER",
                        "onClick": {
                          "openLink": {
                            "url": "https://example.com/orders/..."
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