
# Space News

SpaceNews is a SwiftUI-based iOS app that showcases the latest from the Galaxy. The app makes an API request and decodes via JSON, then displays articles in a list view. Selecting an article opens it using WebKit, which allows users to view the article without having to open Safari.

## API Reference

#### Space News Api

```http
  https://www.spaceflightnewsapi.net
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | https://api.spaceflightnewsapi.net/v3/articles |


## Tech Stack

**Client:** Swift, SwiftUi, WebKit, CachedAsyncImage

**Server:** XCode 


## Features

- Light/dark mode toggle
- Latest space news articles
- Updated regulary


## Preview

![SpaceNewsGif](https://user-images.githubusercontent.com/79447152/184193374-9f877b6b-75fd-46e0-b85a-c966aa87a9ed.gif)

