## Table of contents

- [General info](#general-info)
- [Technologies](#technologies)
- [Setup](#setup)
- [LICENSE](#licencse)

## General info

This project is a simple implementation of [Shanaykit UI][1] which leverage IMDb API to get movies data.

## Technologies

Project is created with:

- Flutter 3
- [Flutter screen util][2] for adapting screen and let the UI responsive with different screen size
- http
- [Palette generator][4] for generating color palette for a source of image

## Setup

To run this project, install it locally using:

- Visit [IMDb API website][3] and create an api key
- Run the script below

```
$ cd moviez_streaming
$ echo "const apiKey = [your IMDb api key];" > lib/api_key.dart
$ flutter pub get
$ flutter run
```

## LICENSE

[MIT][https://choosealicense.com/licenses/mit/]

[1]: https://shaynakit.com/details/moviez-streaming
[2]: https://pub.dev/packages/flutter_screenutil
[3]: https://imdb-api.com/
[4]: https://pub.dev/packages/palette_generator
