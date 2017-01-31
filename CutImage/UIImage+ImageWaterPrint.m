//
//  UIImage+ImageWaterPrint.m
//  CutImage
//
//  Created by zhuzhilong on 17/1/31.
//  Copyright © 2017年 zhuzhilong. All rights reserved.
//

#import "UIImage+ImageWaterPrint.h"

@implementation UIImage (ImageWaterPrint)
-(UIImage *)imageWater:(UIImage *)imageLogo waterString:(NSString *)waterString{

    UIGraphicsBeginImageContext(self.size);
    //原始图片渲染
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGFloat waterX = self.size.width-40;
    CGFloat waterY = self.size.height-40;
    CGFloat waterW = 40;
    CGFloat waterH = 40;
    //logo渲染
    [imageLogo drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    //渲染文字
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle]mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:20.0],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor redColor]};
    [waterString drawInRect:CGRectMake(0, 0, 300, 60) withAttributes:dic];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}
@end
