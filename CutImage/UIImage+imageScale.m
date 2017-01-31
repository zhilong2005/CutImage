//
//  UIImage+imageScale.m
//  CutImage
//
//  Created by zhuzhilong on 17/1/31.
//  Copyright © 2017年 zhuzhilong. All rights reserved.
//

#import "UIImage+imageScale.h"

@implementation UIImage (imageScale)
-(UIImage *)imageScaleSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}
@end
