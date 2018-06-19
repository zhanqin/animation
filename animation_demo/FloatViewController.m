//
//  FloatViewController.m
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "FloatViewController.h"

@interface FloatViewController ()

//判断是否是当前ViewController，如果不是，则停止动画，否则动画一直在,且dealloc方法不会被调用
@property(nonatomic,assign) BOOL isCurrentVC;
@end

@implementation FloatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView * animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 105, 144, 350)];
    animationImageView.image = [UIImage imageNamed:@"image_city_angel_login_girl"];
    [self setAnimationImageViewAnimation:animationImageView];
    [self.view addSubview:animationImageView];
}

-(void)dealloc{
    NSLog(@"FloatViewController dealloc");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.isCurrentVC = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.isCurrentVC = NO;
}

-(void)setAnimationImageViewAnimation:(UIImageView *)animationImageView{
    [UIView animateWithDuration:1 animations:^{
        animationImageView.frame = CGRectMake(30, 90, 144, 350);
    }];
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animationImageView.frame = CGRectMake(30, 105, 144,350);
        
    } completion:^(BOOL finished) {
        if (self.isCurrentVC) {
            [self setAnimationImageViewAnimation:animationImageView];
        }
    }];
    
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
