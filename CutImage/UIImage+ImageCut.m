//
//  UIImage+ImageCut.m
//  CutImage
//
//  Created by zhuzhilong on 17/1/31.
//  Copyright © 2017年 zhuzhilong. All rights reserved.
//

#import "UIImage+ImageCut.h"

@implementation UIImage (ImageCut)
-(UIImage *)ImageCutSize:(CGRect)rect{
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallRect = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    //开始绘制
    UIGraphicsBeginImageContext(smallRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallRect, subImageRef);
    UIImage *image = [UIImage imageWithCGImage:subImageRef];
    
    //结束绘制
    UIGraphicsEndImageContext();
    return image;
}
@end
