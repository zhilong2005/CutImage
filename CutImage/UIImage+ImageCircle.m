//
//  UIImage+ImageCircle.m
//  CutImage
//
//  Created by zhuzhilong on 17/1/31.
//  Copyright © 2017年 zhuzhilong. All rights reserved.
//

#import "UIImage+ImageCircle.h"

@interface view : UIView
@property(nonatomic,retain)UIImage *image;
@end
@implementation view

-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, rect.size.width/2, rect.size.height/2));
    CGContextClip(ctx);
    CGContextFillPath(ctx);
    [_image drawAtPoint:CGPointMake(0, 0)];
    CGContextRestoreGState(ctx);
}

@end
@implementation UIImage (ImageCircle)
-(UIImage *)imageClipCircle{
    CGFloat imageSizeMin = MIN(self.size.width, self.size.height);
    CGSize imageSize = CGSizeMake(imageSizeMin, imageSizeMin);
    
    view *myview = [[view alloc]init];
    myview.image = self;
    
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    myview.frame = CGRectMake(0, 0, imageSizeMin, imageSizeMin);
    myview.backgroundColor = [UIColor whiteColor];
    [myview.layer renderInContext:context];
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageNew;
}
@end
