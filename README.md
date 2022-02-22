# Drone Google Chat

A simple script that posts a card into a google chat using a webhook.

## Usage

### Docker

```bash
docker run --rm \
  -e PLUGIN_URL="https://chat.googleapis.com/v1/spaces/<spaces_id>/messages" \
  -e PLUGIN_KEY=<spaces_key> \
  -e PLUGIN_TOKEN=<spaces_token> \
  -e DRONE_BUILD_NUMBER=<build_number> \
  -e DRONE_BUILD_STATUS=<build_status> \
  -e DRONE_BUILD_LINK=<build_link> \
  -e DRONE_REPO_NAME=<repo_name> \
  -e DRONE_COMMIT_BRANCH=<commit_branch> \
  -e DRONE_COMMIT_MESSAGE=<commit_message> \
  -e DRONE_COMMIT_AUTHOR=<commit_author> \
  -e DRONE_COMMIT_LINK=<commit_link> \
  mcsteen/drone-google-chat
```

### Drone Step

```yaml
steps:
...
- name: Google Chat Alert
  image: mcsteen/drone-google-chat:latest
  settings:
    URL: "https://chat.googleapis.com/v1/spaces/<spaces_id>/messages"
    KEY: <spaces_key>
    TOKEN: <spaces_token>

  # optional triggers
  when:
    status:
      - failure
```

### Drone Step *using secrets*

```yaml
steps:
...
- name: Google Chat Alert
  image: mcsteen/drone-google-chat:latest
  settings:
    URL:
      from_secret: GOOGLE_CHAT_WEBHOOK
    KEY: 
      from_secret: GOOGLE_CHAT_KEY
    TOKEN:
      from_secret: GOOGLE_CHAT_TOKEN

  # optional triggers
  when:
    status:
      - failure
```
