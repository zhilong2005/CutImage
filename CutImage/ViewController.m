//
//  ViewController.m
//  CutImage
//
//  Created by zhuzhilong on 17/1/31.
//  Copyright © 2017年 zhuzhilong. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageCut.h"
#import "UIImage+ImageCircle.h"
#import "UIImage+imageScale.h"
#import "UIImage+ImageWaterPrint.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //图片剪切
    //[self imageTestCut];
    //图片剪切并绘制成圆形
    //[self imageTestCircle];
    //图片任意拉伸
    //[self imageTestScale];
    //给图片添加文字水印，logo水印
    [self imageTestWater];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)imageTestWater{
    UIImage *_image =[UIImage imageNamed:@"1.png"];
    UIImage *logo =[UIImage imageNamed:@"0.png"];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.image =_image ;
    
    UIImage *newImage = [_image imageWater:logo waterString:@"wwww.zhizhilong.com"];
    
    UIImageView *waterImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 205, 200, 200)];
    [self.view addSubview:waterImageView];
    waterImageView.image = newImage;
    //保存至手机相册
    UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil) ;
}


-(void)imageTestScale{
    UIImage *_image =[UIImage imageNamed:@"1.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.image =_image ;
    
    UIImage *scaleImage = [_image imageScaleSize:CGSizeMake(150, 300)];
    
    UIImageView *scaleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 205, scaleImage.size.width, scaleImage.size.height)];
    [self.view addSubview:scaleImageView];
    scaleImageView.image = scaleImage;
    //保存至手机相册
    UIImageWriteToSavedPhotosAlbum(scaleImage, nil, nil, nil) ;
}


-(void)imageTestCircle{
    UIImage *_image =[UIImage imageNamed:@"1.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.image =_image ;
    
    UIImage *circleImage = [_image imageClipCircle];
    
    UIImageView *circleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 205, 200, 200)];
    [self.view addSubview:circleImageView];
    circleImageView.image = circleImage;
    //保存至手机相册
    UIImageWriteToSavedPhotosAlbum(circleImage, nil, nil, nil) ;
}
-(void)imageTestCut{
    
 
    UIImage *_image =[UIImage imageNamed:@"1.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.image =_image ;
    
    UIImage *cutImage = [_image ImageCutSize:CGRectMake(100, 100, 100, 100)];
    
    UIImageView *cutImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 205, 100, 100)];
    [self.view addSubview:cutImageView];
    cutImageView.image = cutImage;
    //保存至手机相册
    UIImageWriteToSavedPhotosAlbum(cutImage, nil, nil, nil);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
