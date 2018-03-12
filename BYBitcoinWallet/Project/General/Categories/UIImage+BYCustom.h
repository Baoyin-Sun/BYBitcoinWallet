//
//  UIImage+BYCustom.h
//  BYGeneralCodeDemo
//
//  Created by BaoYin on 2017/8/31.
//  Copyright © 2017年 BaoYin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BYCustom)
+ (UIImage *)resizeWithImageName:(NSString *)imageName;
+ (UIImage *)resizeWithScale:(NSString *)imageName Wscale:(CGFloat)w Hscale:(CGFloat)h;
+ (UIImage *)headerPlaceholder;

/**
 绘制⭕️图片
 
 @return 返回图像
 */
- (UIImage *)drawCircleImage;

- (UIImage *)drawCircleImageWithRadius:(int)radius;

//等比例缩放
- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size;

//等比例剪裁缩放
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect;

//根据颜色生成image
+ (UIImage *)imageWithColor:(UIColor *)color;

//改变image方向
- (UIImage *)fixOrientation;
@end
