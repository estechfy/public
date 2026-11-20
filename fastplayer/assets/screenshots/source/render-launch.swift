import AppKit
// 日本語・英語の掲載画像に実際のウィンドウを等比配置する。
let folder = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
let base = NSColor(srgbRed: 0.035, green: 0.105, blue: 0.13, alpha: 1)
let accent = NSColor(srgbRed: 0.63, green: 0.94, blue: 0.77, alpha: 1)
func label(_ text: String, x: CGFloat, y: CGFloat, size: CGFloat, weight: NSFont.Weight, color: NSColor, width: CGFloat = 2320) {
    var font = NSFont.systemFont(ofSize: size, weight: weight)
    while (text as NSString).size(withAttributes: [.font:font]).width > width { font = .systemFont(ofSize:font.pointSize-1,weight:weight) }
    (text as NSString).draw(at:NSPoint(x:x,y:y),withAttributes:[.font:font,.foregroundColor:color])
}
func picture(_ file: String, box: NSRect) {
    let image = NSImage(contentsOf:folder.appendingPathComponent("source/"+file))!
    let factor=min(box.width/image.size.width,box.height/image.size.height)
    let w=image.size.width*factor,h=image.size.height*factor
    image.draw(in:NSRect(x:box.midX-w/2,y:box.midY-h/2,width:w,height:h))
}
let names=["01-playback","02-encryption","03-comics","04-protected-cut"]
let sources=["playback-window.jpg","encrypt-ui.png","comic-spread.jpg","cut-ui.png"]
let japanese=["軽快に再生。見たい場面へ。","Googleアカウントで、動画を保護","コミックは、右開きの見開きで","保護したまま、必要な場面だけ残す"]
let english=["Preview a scene. Jump straight in.","Protect videos with your Google Account","Read comics in a right-to-left spread","Trim while your video stays protected"]
let jaDetail=["Finderから開き、シークバーで場面をプレビュー。","ファイルやフォルダをまとめて暗号化。専用パスワードは不要です。","ZIP・CBZ、RAR・CBRや画像フォルダを、そのまま開けます。","緑は残す部分、赤は削る部分。編集前の動画も保存されます。"]
let enDetail=["Open a video in Finder and preview it on the timeline.","Encrypt files or folders on your Mac. No separate password to remember.","Open ZIP, CBZ, RAR, CBR or a folder of images.","Review what stays in green and what goes in red. Keep the pre-edit video."]
for lang in ["ja","en-US"] {
    let dir=folder.appendingPathComponent(lang)
    try FileManager.default.createDirectory(at:dir,withIntermediateDirectories:true)
    for i in names.indices {
        let rep=NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:2560,pixelsHigh:1600,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0)!
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current=NSGraphicsContext(bitmapImageRep:rep)
        NSGradient(starting:base,ending:NSColor(srgbRed:0.09,green:0.23,blue:0.23,alpha:1))!.draw(in:NSRect(x:0,y:0,width:2560,height:1600),angle:20)
        label(i==1 || i==3 ? "FastPlayer Pro" : "FastPlayer",x:118,y:1480,size:47,weight:.medium,color:accent)
        label(lang=="ja" ? japanese[i]:english[i],x:114,y:1320,size:106,weight:.bold,color:.white)
        label(lang=="ja" ? jaDetail[i]:enDetail[i],x:120,y:1222,size:46,weight:.regular,color:.white)
        if i==1 {
            picture(sources[i],box:NSRect(x:120,y:255,width:1770,height:850))
            picture("finder-fpv.jpg",box:NSRect(x:1920,y:400,width:510,height:455))
        } else {
            picture(sources[i],box:NSRect(x:106,y:62,width:2348,height:1100))
        }
        NSGraphicsContext.restoreGraphicsState()
        try rep.representation(using:.jpeg,properties:[.compressionFactor:0.94])!.write(to:dir.appendingPathComponent(names[i]+(lang == "en-US" ? "-en.jpg" : ".jpg")))
    }
}
