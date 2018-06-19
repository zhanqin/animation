//
//  SingleLineViewController.m
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "SingleLineViewController.h"
#import "AnimationModel.h"

@interface SingleLineViewController ()

@property(nonatomic,strong) NSMutableArray * lineArray;

@end

@implementation SingleLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self setupLineAnimation];
}

-(void)dealloc{
    NSLog(@"SingleLineViewController dealloc");
}

-(void)initData{
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:@"animation" ofType:@"json"];
    NSData * data = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray * animationArray = dic[@"single_line_animations"];
    self.lineArray = [NSMutableArray array];
    for (NSDictionary * item in animationArray) {
        AnimationModel * model = [[AnimationModel alloc] init];
        [model setValuesForKeysWithDictionary:item];
        [self.lineArray addObject:model];
    }
}

-(void)setupLineAnimation{
    for (AnimationModel * model in self.lineArray) {
        UIImageView * animationImageView = [[UIImageView alloc] init];
        animationImageView.image = [UIImage imageNamed:model.images[0]];
        animationImageView.frame = CGRectMake(model.toX, model.toY, animationImageView.image.size.width, animationImageView.image.size.height);
        [self.view addSubview:animationImageView];
        [self addSingleLineAnimationToView:animationImageView animationModel:model];
    }
}

-(void)addSingleLineAnimationToView:(UIView *)view animationModel:(AnimationModel *)model{
    CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(model.fromX,model.fromY)];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(model.toX,model.toY)];
    moveAnimation.duration = model.time;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.repeatCount = MAXFLOAT;
    if (model.loop == 0) {
        moveAnimation.repeatCount = 1;
    }
    [view.layer addAnimation:moveAnimation forKey:@"singleLineAnimation"];
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
