# changelog

CHANGELOG生成用イメージ

- CHANGELOG.mdの生成
- rpm用のspecファイルへのCHANGELOG挿入(オプションでON/OFF可能)
- deb用のchangelogファイルへの挿入(オプションでON/OFF可能)
- PullRequest作成用のCHANGELOGテキスト作成(標準出力)

## Usage

```bash
docker run -it --rm \
    -e GITHUB_TOKEN \
    -e RELEASE_FROM=0.15.0 \
    -e RELEASE_TO=0.16.0 \
    -e APP_NAME=usacloud \
    -e ENABLE_RPM=1 \
    -e ENABLE_DEB=1 \
    -v $PWD:/workdir sacloud/generate-changelog:latest
```

`-v`または`--volume`オプションでgitリポジトリをバインドマウントする必要があります。
また、PullRequest作成用のCHANGELOGテキストが標準出力に出力されます。  
必要に応じてリダイレクトを行ってください。  

### Environment variables

`*` is required.

- `APP_NAME`(*) : アプリケーション名
- `RELEASE_FROM`(*): CHANGELOG作成の起点バージョン(semver)
- `RELEASE_TO`(*): リリースするバージョン(semver)
- `USERNAME`: CHANGELOG内に記載されるユーザー名(デフォルト: `sacloud-bot`)
- `EMAIL`: CHANGELOG内に記載されるe-mailアドレス(デフォルト: `sacloud.users@gmail.com`)
- `CHANGELOG_PATH`: CHANGELOGのパス(デフォルト:`CHANGELOG.md`)
- `ENABLE_RPM`:  rpm用の処理ON/OFF(ONにする場合空ではない文字列を指定)
- `RPM_SPEC_PATH`: rpm用のspecファイルパス(デフォルト: `package/rpm/${APP_NAME}.spec`)
- `ENABLE_DEB`: deb用の処理ON/OFF(ONにする場合空ではない文字列を指定)
- `DEB_CHANGELOG_PATH`: deb用のchangelogファイルパス(デフォルト: `package/deb/debian/changelog`)

