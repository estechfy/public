# FastPlayerのストア掲載画像

## 1.0.0 build 13 の日英画像

`ja/` と `en-US/` は各4枚、2560×1600のJPEG。再生プレビュー、暗号化結果とFinder、右開き見開き、保護カットの順。英語版は見出しと説明を翻訳し、操作部分には同じ日本語環境の実画面を使用した。

このフォルダで `swift source/render-launch.swift .` を実行すると両言語の画像を生成できる。再生素材は [審査用の自作動画](../../review/FastPlayer-sample.mp4)。プレイヤー上でシークバーのプレビューを表示し、CBZの2–3ページを開いて撮影した。暗号化とカットはデモ用の表示名を使った。Finderは撮影用のFPVのみを切り出した。

コミック原画は `source/coastal-railway.png`。ImageGen用の生成指示は以下。

> Original wordless Japanese travel manga, a double-page spread viewed flat and straight-on. A hand-inked seaside train journey. Right-hand page has three crisp inset panels showing an adult traveler holding a ticket, a rural platform, and the little train arriving. Left-hand page has two panels with a sweeping wide coastal railway viaduct and the traveler looking out toward the glittering sea. Detailed black ink hatching on warm white paper, restrained sea-teal spot color. Clear white vertical center gutter at exactly half width so the two pages can be split there. No text, no logos, no signatures, no reference to existing IP. Horizontal 3:2 composition, full bleed, no device or book mockup.

## 以前の暗号化・カットの掲載画像

日本語・Mac向けの2560×1600px。1枚目は自作MP4を3件暗号化した結果、2枚目はそのFPVを開いて4〜9秒の区間を追加した高速カット画面です。アカウント表示には撮影用の「デモ用アカウント」を使用しています。`source/encrypt-ui.png` と `source/cut-ui.png` はアプリの実装で描画した画面です。

```sh
swift source/format-protection.swift .
```

## 旧掲載画像（build 9）


2026-11-19、1.0.0 build 9の実画面。Pro体験でも利用できる字幕設定・音声設定を掲載する。

- `02-subtitles.jpg`：主字幕・副字幕、字幕サイズ・タイミングの設定画面。
- `03-audio.jpg`：ボイスブースト、最大300%の音量、10バンドEQ、出力先の設定画面。
- いずれも2560×1600px、JPEG（透過なし）。App Store Connectの日本語・Mac向けにアップロードする画像。
- 背景の動画は[審査用の自作素材](../../review/)。私用・第三者の動画を含まない。
- `source/` に実画面の撮影データと整形コードを保存。OSの共有表示を含む上端64pxだけを除き、アプリ画面は等倍配置。説明見出しを別領域へ追加している。UIの内容や配置は加工していない。

## macOSで再生成

このディレクトリで実行する。

```sh
swiftc source/format-screenshots.swift -o /tmp/fastplayer-format-screenshots
/tmp/fastplayer-format-screenshots source/subtitles-native.jpg 02-subtitles.jpg '字幕を重ねて、学びを深く。' '主字幕・副字幕を選び、サイズとタイミングを調整。'
/tmp/fastplayer-format-screenshots source/audio-native.jpg 03-audio.jpg '聞きたい音に、整える。' 'ボイスブースト、10バンドEQ、音声の出力先をひとつの画面で。'
```

App Storeへのアプリ公開・審査承認を示すものではない。
