//
//  BZFireworkAnimationView.m
//  BZSaveMoney
//
//  Created by zhanqin on 2018/2/2.
//  Copyright © 2018年 QQ. All rights reserved.
//

#import "BZFireworkAnimationView.h"

@interface BZFireworkAnimationView ()

@property (nonatomic, strong) CAEmitterLayer *explosionLayer;
@property (nonatomic, strong) CAEmitterCell *explosionCell;

@end

@implementation BZFireworkAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.clipsToBounds = NO;
    self.userInteractionEnabled = NO;
    /**
     *  爆炸效果
     */
    _explosionCell = [CAEmitterCell emitterCell];
    _explosionCell.name = @"explosion";
    _explosionCell.alphaRange = 0.2f; // 透明度改变的范围
    _explosionCell.alphaSpeed = -1.0f; // 透明度改变的速度
    _explosionCell.lifetime = 0.7f;
    _explosionCell.lifetimeRange = 0.3f;
    _explosionCell.birthRate = 0.f; // 粒子产生系数
    _explosionCell.velocity = 40.0f;
    _explosionCell.velocityRange = 10.0f;
    
    _explosionLayer = [CAEmitterLayer layer];
    _explosionLayer.name = @"emitterLayer";
    _explosionLayer.emitterShape = kCAEmitterLayerCircle; // 发射形状
    _explosionLayer.emitterMode = kCAEmitterLayerOutline;
    _explosionLayer.emitterSize = CGSizeMake(25.f, 0.f);
    _explosionLayer.emitterCells = @[_explosionCell];
    _explosionLayer.renderMode = kCAEmitterLayerOldestFirst; // 渲染模式
    _explosionLayer.masksToBounds = NO;
    [self.layer addSublayer:_explosionLayer];
    
}

//布局
- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置位置
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.explosionLayer.emitterPosition = center;
}

#pragma mark - Animate Methods
- (void)animate {
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        self.explosionLayer.beginTime = CACurrentMediaTime();
        //爆炸效果
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"emitterCells.explosion.birthRate"];
        animation.fromValue = @0;
        animation.toValue = @500;
        [self.explosionLayer addAnimation: animation forKey: nil];
    });
}

#pragma mark - Properties Method
- (void)setParticleImage:(UIImage *)particleImage {
    _particleImage = particleImage;
    self.explosionCell.contents = (id)[particleImage CGImage];
}

- (void)setParticleScale:(CGFloat)particleScale {
    _particleScale = particleScale;
    self.explosionCell.scale = particleScale;
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    _particleScaleRange = particleScaleRange;
    self.explosionCell.scaleRange = particleScaleRange;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
