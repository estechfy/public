# 審査・操作確認用サンプル

2026-11-19作成。自作の図形・文字と合成音だけを使用する。利用者の原本やGoogle認証情報は含めない。確認用動画・スクリーンショット作成への利用を許可する。

`draw-demo.swift` が映像原画の生成元。macOSで `swift draw-demo.swift demo.png` を実行し、FFmpegで20秒・30fps、H.264/AACへ変換した。図形に緩やかなズームと低音量の220Hz合成音を加えている。キー間隔は30フレーム、映像1920×1080、音声48kHz。第三者のコンテンツは使わない。

この動画は性能・画質・同期の網羅試験用素材ではない。App Store掲載画像では最新のアプリで実際に再生した画面を撮影する。

再生成例（FFmpegは別途用意）：

```sh
swift draw-demo.swift demo.png
ffmpeg -loop 1 -i demo.png -f lavfi -i 'sine=frequency=220:sample_rate=48000' -t 20 -vf 'scale=1920:1080,zoompan=z=min(zoom+0.00004\,1.04):d=1:s=1920x1080:fps=30' -af 'volume=0.03,afade=t=in:d=1,afade=t=out:st=19:d=1' -c:v libx264 -preset fast -crf 23 -pix_fmt yuv420p -g 30 -c:a aac -b:a 96k -movflags +faststart FastPlayer-sample.mp4
```
