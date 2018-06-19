//
//  BZFireworkAnimationButton.m
//  BZSaveMoney
//
//  Created by zhanqin on 2018/2/2.
//  Copyright © 2018年 QQ. All rights reserved.
//

#import "BZFireworkAnimationButton.h"
#import "BZFireworkAnimationView.h"

@interface BZFireworkAnimationButton ()

@property (nonatomic, strong) BZFireworkAnimationView *fireworksView;

@end

@implementation BZFireworkAnimationButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.clipsToBounds = NO;
    _fireworksView = [[BZFireworkAnimationView alloc] init];
    [self insertSubview:_fireworksView atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.fireworksView.frame = self.bounds;
    [self insertSubview:self.fireworksView atIndex:0];
}

#pragma mark - Methods
- (void)animate {
    [self.fireworksView animate];
}

//弹出
- (void)popOutsideWithDuration:(NSTimeInterval)duration {
    
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            self.transform = CGAffineTransformMakeScale(2.0f, 2.0f); // 放大
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            self.transform = CGAffineTransformMakeScale(0.8f, 0.8f); // 放小
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f); //恢复原样
        }];
    } completion:nil];
}
//弹进
- (void)popInsideWithDuration:(NSTimeInterval)duration {
    
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0 animations: ^{
            self.transform = CGAffineTransformMakeScale(0.7f, 0.7f); // 放小
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations: ^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f); //恢复原样
        }];
    } completion:nil];
}

#pragma mark - Properties
//获取粒子图像
- (UIImage *)particleImage {
    return self.fireworksView.particleImage;
}
//设置粒子图像
- (void)setParticleImage:(UIImage *)particleImage {
    self.fireworksView.particleImage = particleImage;
}
//获取缩放
- (CGFloat)particleScale {
    return self.fireworksView.particleScale;
}
//设置缩放
- (void)setParticleScale:(CGFloat)particleScale {
    self.fireworksView.particleScale = particleScale;
}
//获取缩放范围
- (CGFloat)particleScaleRange {
    return self.fireworksView.particleScaleRange;
}
//设置缩放范围
- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    self.fireworksView.particleScaleRange = particleScaleRange;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
