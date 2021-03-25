# Drone Google Chat
A simple script that posts a card into a google chat using a webhook. More features to be added.

### Usage
```yaml
- name: google-chat
  image: mcsteen/drone-google-chat:latest
  settings:
  URL:
    from_secret: GOOGLE_CHAT_WEBHOOK
  KEY: GOOGLE_CHAT_KEY
    from_secret: GOOGLE_CHAT_KEY
  TOKEN: GOOGLE_CHAT_TOKEN
    from_secret: GOOGLE_CHAT_TOKEN
  
  # optional triggers
  when:
    status:
      - failure
      - success 
```