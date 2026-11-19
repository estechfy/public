import AppKit

// 実画面の縦横比を保ち、ストアのMac横長サイズへ配置する。
let folder = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
let green = NSColor(srgbRed: 0.59, green: 0.92, blue: 0.74, alpha: 1)
let ink = NSColor(srgbRed: 0.05, green: 0.12, blue: 0.15, alpha: 1)
func label(_ value: String, _ x: CGFloat, _ y: CGFloat, _ size: CGFloat, _ weight: NSFont.Weight, _ color: NSColor) {
    (value as NSString).draw(at: NSPoint(x:x,y:y), withAttributes:[.font:NSFont.systemFont(ofSize:size,weight:weight),.foregroundColor:color])
}
func render(cut: Bool) throws {
    let name = cut ? "cut" : "encrypt"
    let screen = NSImage(contentsOf: folder.appendingPathComponent("source/"+name+"-ui.png"))!
    let rep = NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:2560,pixelsHigh:1600,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0)!
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep:rep)
    NSGradient(starting:ink,ending:NSColor(srgbRed:0.06,green:0.24,blue:0.23,alpha:1))!.draw(in:NSRect(x:0,y:0,width:2560,height:1600),angle:24)
    label("FastPlayer Pro",130,1430,56,.medium,green)
    if cut {
        label("保護したまま、",125,1040,126,.bold,.white)
        label("動画をカット。",125,864,126,.bold,.white)
        label("緑は残す区間。赤は削る区間。",132,670,51,.medium,.white)
        label("高速カットはキーフレームに合わせて",132,512,45,.regular,.white)
        label("画質と音質を保ちます。",132,440,45,.regular,.white)
        screen.draw(in:NSRect(x:1340,y:100,width:1160,height:1160*screen.size.height/screen.size.width))
    } else {
        label("動画をまとめて暗号化。",122,1190,136,.bold,.white)
        label("ファイルやフォルダを選んで保護。作成したGoogleアカウントで開けます。",130,1050,54,.regular,.white)
        let width: CGFloat = 2280
        screen.draw(in:NSRect(x:140,y:70,width:width,height:width*screen.size.height/screen.size.width))
    }
    NSGraphicsContext.restoreGraphicsState()
    try rep.representation(using:.jpeg,properties:[.compressionFactor:0.95])!.write(to:folder.appendingPathComponent(cut ? "02-protected-cut.jpg":"01-encryption.jpg"))
}
try render(cut:false)
try render(cut:true)
