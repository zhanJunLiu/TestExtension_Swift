# 类扩展基本概念以及个人理解
* 向一个已有的类, 结构体或枚举类型添加新功能, 包括在没有获取源代码的情况下扩展类型的能力(逆向建模)
* 扩展最大的优势是工程结构更加清晰

#工程中几个常用的类扩展函数

```
// 为UIView添加移动效果扩展函数
    func movetoXWithDuration(toX:CGFloat, duration: Double){}
// movetoY(Y轴移动)
// moveToPoint(向任意Point点移动)
```

```
为Int类型添加两个类属性(类型转换)
var FloatValue: CGFloat {return CGFloat(self)}
var DoubleValue: Double {return Double(self)}
```

```
/** 
        图片压缩处理
        返回一张压缩处理过后的图片
     */
    func imageCompress(targetWith: CGFloat) -> UIImage{}
    
    /** 
        图片的模糊处理
        返回一张模糊处理过后的图片
     */
    func blurImage(value: NSNumber) -> UIImage {}
```


