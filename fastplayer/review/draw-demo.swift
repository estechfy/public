import AppKit
let w=1920, h=1080
let rep=NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:w,pixelsHigh:h,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current=NSGraphicsContext(bitmapImageRep:rep)
func color(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat)->NSColor { NSColor(srgbRed:r,green:g,blue:b,alpha:1) }
NSGradient(starting:color(0.035,0.11,0.17),ending:color(0.23,0.43,0.48))!.draw(in:NSRect(x:0,y:0,width:w,height:h),angle:90)
color(0.88,0.96,0.82).setFill();NSBezierPath(ovalIn:NSRect(x:1390,y:690,width:170,height:170)).fill()
func ridge(_ points:[NSPoint],_ fill:NSColor) {let p=NSBezierPath();p.move(to:points[0]);for v in points.dropFirst(){p.line(to:v)};p.close();fill.setFill();p.fill()}
ridge([NSPoint(x:0,y:0),NSPoint(x:0,y:330),NSPoint(x:400,y:780),NSPoint(x:720,y:410),NSPoint(x:1040,y:710),NSPoint(x:1510,y:260),NSPoint(x:1920,y:520),NSPoint(x:1920,y:0)],color(0.14,0.32,0.35))
ridge([NSPoint(x:0,y:0),NSPoint(x:0,y:220),NSPoint(x:430,y:480),NSPoint(x:800,y:290),NSPoint(x:1250,y:530),NSPoint(x:1660,y:240),NSPoint(x:1920,y:340),NSPoint(x:1920,y:0)],color(0.07,0.23,0.27))
ridge([NSPoint(x:0,y:0),NSPoint(x:0,y:70),NSPoint(x:500,y:260),NSPoint(x:950,y:180),NSPoint(x:1340,y:340),NSPoint(x:1920,y:90),NSPoint(x:1920,y:0)],color(0.035,0.15,0.2))
let trail=NSBezierPath();trail.move(to:NSPoint(x:970,y:0));trail.curve(to:NSPoint(x:1340,y:340),controlPoint1:NSPoint(x:1520,y:160),controlPoint2:NSPoint(x:1100,y:220));trail.lineWidth=5;color(0.57,0.84,0.69).setStroke();trail.stroke()
func label(_ text:String,_ x:CGFloat,_ y:CGFloat,_ size:CGFloat,_ weight:NSFont.Weight,_ fill:NSColor){(text as NSString).draw(at:NSPoint(x:x,y:y),withAttributes:[.font:NSFont.systemFont(ofSize:size,weight:weight),.foregroundColor:fill])}
label("AFTER THE RAIN",140,875,70,.light,.white)
label("A quiet place to begin.",144,822,25,.regular,color(0.76,0.9,0.86))
label("FASTPLAYER  /  ORIGINAL SAMPLE",145,76,17,.medium,color(0.68,0.83,0.8))
NSGraphicsContext.restoreGraphicsState()
try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:CommandLine.arguments[1]))
