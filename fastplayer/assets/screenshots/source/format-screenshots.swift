import AppKit
let input=URL(fileURLWithPath:CommandLine.arguments[1]);let output=URL(fileURLWithPath:CommandLine.arguments[2]);let title=CommandLine.arguments[3];let subtitle=CommandLine.arguments[4]
let source=NSImage(contentsOf:input)!
let rep=NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:2560,pixelsHigh:1600,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0)!
NSGraphicsContext.saveGraphicsState();NSGraphicsContext.current=NSGraphicsContext(bitmapImageRep:rep)
NSColor(srgbRed:0.025,green:0.075,blue:0.105,alpha:1).setFill();NSRect(x:0,y:0,width:2560,height:1600).fill()
let bitmap=NSBitmapImageRep(data:try Data(contentsOf:input))!;source.size=NSSize(width:bitmap.pixelsWide,height:bitmap.pixelsHigh)
precondition(bitmap.pixelsWide==2560 && bitmap.pixelsHigh==1440)
// OSの共有インジケータがある上端64pxを除き、実際のアプリ画面を等倍で配置する。
source.draw(in:NSRect(x:0,y:40,width:2560,height:1376),from:NSRect(x:0,y:0,width:2560,height:1376),operation:.sourceOver,fraction:1)
(title as NSString).draw(at:NSPoint(x:64,y:1500),withAttributes:[.font:NSFont.systemFont(ofSize:50,weight:.semibold),.foregroundColor:NSColor.white])
(subtitle as NSString).draw(at:NSPoint(x:66,y:1448),withAttributes:[.font:NSFont.systemFont(ofSize:26,weight:.regular),.foregroundColor:NSColor(srgbRed:0.65,green:0.84,blue:0.8,alpha:1)])
("FastPlayer Pro  |  30日無料体験" as NSString).draw(at:NSPoint(x:2110,y:1514),withAttributes:[.font:NSFont.systemFont(ofSize:26,weight:.medium),.foregroundColor:NSColor.white])
NSGraphicsContext.restoreGraphicsState();try rep.representation(using:.jpeg,properties:[.compressionFactor:0.95])!.write(to:output)
