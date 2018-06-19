//
//  LineGifViewController.m
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "LineGifViewController.h"
#import "AnimationModel.h"

@interface LineGifViewController ()

@property(nonatomic,strong) NSMutableArray * lineGifArray;

@end

@implementation LineGifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self setupLineGifAnimation];
}

-(void)dealloc{
    NSLog(@"LineGifViewController dealloc");
}

-(void)initData{
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:@"animation" ofType:@"json"];
    NSData * data = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray * lineGifArray = dic[@"walk_animation"];
    self.lineGifArray = [NSMutableArray array];
    for (NSDictionary * item in lineGifArray) {
        AnimationModel * model = [[AnimationModel alloc] init];
        [model setValuesForKeysWithDictionary:item];
        [self.lineGifArray addObject:model];
    }
}

-(void)setupLineGifAnimation{
    for (AnimationModel * model in self.lineGifArray) {
        UIImageView * animationImageView = [[UIImageView alloc] init];
        animationImageView.image = [UIImage imageNamed:model.images[0]];
        animationImageView.frame = CGRectMake(model.toX, model.toY, animationImageView.image.size.width, animationImageView.image.size.height);
        NSMutableArray * imagesArray = [NSMutableArray array];
        for (NSString * imagesName in model.images) {
            UIImage * tempImage = [UIImage imageNamed:imagesName];
            [imagesArray addObject:tempImage];
        }
        animationImageView.animationImages = [imagesArray copy];
        animationImageView.animationDuration = 1.2;
        animationImageView.animationRepeatCount = 1000000000;
        [animationImageView startAnimating];
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
    [view.layer addAnimation:moveAnimation forKey:@"lineGifAnimation"];
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
