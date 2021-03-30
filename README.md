# NEYU Shop

## How to build

1. Run `flutter pub get` to get information and packages.
2. Run `flutter build web --release --no-sound-null-safety` to build web app.

## How to setup Codemagic

Setup Codemagic CI/CD to auto run build and deploy to Google Hosting.

1. Get Firebase CI API key. Run `firebase login:ci` to login and get the api key string on command prompt.
2. Encrypt the api key with Codemagic Encrypt environment variables tool.
3. In Environment Variables section, add `FIREBASE_TOKEN` with encrypted token value.
4. Enable web build in Build section, addiction args for command line is `--no-sound-null-safety`.
5. Add Post Build script with `firebase deploy --token "$FIREBASE_TOKEN"`
6. Setup auto trigger in Trigger section with pattern watch on master branch and trigger on push.

## Add assets for web

Note that assets for web is something weird. So add the assets path in pubspec.yaml as normal. To using in code, please use `NetworkImage` or `Image.network` widget with path `assets/<path to asset in pubspec.yaml>`.
