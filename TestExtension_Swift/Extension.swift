
// 向一个已有的类, 结构体或枚举类型添加新功能, 包括在没有获取源代码的情况下扩展类型的能力(逆向建模)
// 扩展最大的优势是工程结构更加清晰

import UIKit


extension NSString {
    func printSelf() {
        print(self)
    }
}


extension UIView {
    
    // 为UIView添加移动效果扩展方法
    func movetoXWithDuration(toX:CGFloat, duration: Double) {
        UIView.animate(withDuration: duration) { 
            self.frame.origin.x = toX
        }
    }
    // movetoY(Y轴移动)
    // moveToPoint(向任意Point点移动)
}

extension Int {
    var FloatValue: CGFloat {return CGFloat(self)}
    var DoubleValue: Double {return Double(self)}
    // 可以添加其他的 属性
}

extension UIImage {
    var height: CGFloat {return self.size.height}
    var width : CGFloat {return self.size.width}
    
    /** 
        图片压缩处理
        返回一张压缩处理过后的图片
     */
    func imageCompress(targetWith: CGFloat) -> UIImage{
        let targetHeight = (targetWith/width)*height
        UIGraphicsBeginImageContext(CGSize(width: targetWith, height: targetHeight))
        draw(in: CGRect(x: 0, y: 0, width: targetWith, height: targetHeight))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /** 
        图片的模糊处理
        返回一张模糊处理过后的图片
     */
    func blurImage(value: NSNumber) -> UIImage {
        
        let context = CIContext(options: [kCIContextUseSoftwareRenderer:true])
        let ciImage = CIImage(image: self)
        // 滤镜
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        // 滤镜输入与输出
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        //模糊程度
        blurFilter?.setValue(value, forKey: "inputRadius")
        
        // 滤镜blurFilter有一个attributes的字典属性, 是用来查看滤镜的处理参数的
        print("滤镜信息查看:\(String(describing: blurFilter?.attributes))")
        
        // 用context处理滤镜
        let imageRef = context.createCGImage((blurFilter?.outputImage)!, from: (ciImage?.extent)!)
        // 用这个ciImage类型获取一张UIImage类型的图片
        let newImage = UIImage(cgImage: imageRef!)
        return newImage
    }
    
}
