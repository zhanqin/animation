//
//  BZFireworkAnimationButton.h
//  BZSaveMoney
//
//  Created by zhanqin on 2018/2/2.
//  Copyright © 2018年 QQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BZFireworkAnimationButton : UIButton

@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;
- (void)popOutsideWithDuration:(NSTimeInterval)duration;
- (void)popInsideWithDuration:(NSTimeInterval)duration;

@end
