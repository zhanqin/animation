//
//  FireAnimationViewController.m
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "FireAnimationViewController.h"
#import "BZFireworkAnimationButton.h"

@interface FireAnimationViewController ()

@property(nonatomic,strong) BZFireworkAnimationButton * praiseButton;

@end

@implementation FireAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.praiseButton];
}

-(void)dealloc{
    NSLog(@"FireAnimationViewController dealloc");
}

-(void)praiseAction:(BZFireworkAnimationButton *)button{
    if (button.selected) {
        [button popInsideWithDuration:0.4f];
    }else{
        [button popOutsideWithDuration:0.4];
        [button animate];
    }
    button.selected = !button.selected;
}

-(BZFireworkAnimationButton *)praiseButton{
    if (!_praiseButton) {
        _praiseButton = [[BZFireworkAnimationButton alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
        _praiseButton.particleImage = [UIImage imageNamed:@"button_bulletin_board_collected"];
        _praiseButton.particleScale = 0.05f;
        _praiseButton.particleScaleRange = 0.02f;
        [_praiseButton addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
        [_praiseButton setImage:[UIImage imageNamed:@"button_bulletin_board_uncollect"] forState:UIControlStateNormal];
        [_praiseButton setImage:[UIImage imageNamed:@"button_bulletin_board_collected"] forState:UIControlStateSelected];
    }
    return _praiseButton;
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
