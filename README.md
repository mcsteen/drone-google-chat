# Drone Google Chat

### Usage
```
 - name: google-chat
   image: <self built image>
   settings:
    URL: GOOGLE_CHAT_WEBHOOK
    KEY: GOOGLE_CHAT_KEY
    TOKEN: GOOGLE_CHAT_TOKEN
   when:
    status:
      - failure
      - success 
```