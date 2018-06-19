//
//  HeartbeatViewController.m
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "HeartbeatViewController.h"

@interface HeartbeatViewController ()

@end

@implementation HeartbeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    imageView.image = [UIImage imageNamed:@"button_bulletin_board_collected"];
    [self.view addSubview:imageView];
    [self setupHeartbeatAnimationInView:imageView];
}

-(void)dealloc{
    NSLog(@"HeartbeatViewController dealloc");
}

-(void)setupHeartbeatAnimationInView:(UIView *)view{
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 动画选项设定
    animation.duration = 1.2; // 动画持续时间
    animation.repeatCount = 10000000000; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.4]; // 结束时的倍率
    animation.removedOnCompletion = NO;
    // 添加动画
    [view .layer addAnimation:animation forKey:@"scale-layer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
