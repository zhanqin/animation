//
//  GifViewController.m
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "GifViewController.h"

@interface GifViewController ()

@end

@implementation GifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray * images = @[@"gif_ferriswheel1",@"gif_ferriswheel2",@"gif_ferriswheel3",@"gif_ferriswheel4",@"gif_ferriswheel5",@"gif_ferriswheel6"];
    UIImageView * imageViews = [[UIImageView alloc] init];
    UIImage * image = [UIImage imageNamed:images[0]];
    imageViews.frame = CGRectMake(120, 200, image.size.width, image.size.height);
    NSMutableArray * imagesArray = [NSMutableArray array];
    for (NSString * imagesName in images) {
        UIImage * tempImage = [UIImage imageNamed:imagesName];
        [imagesArray addObject:tempImage];
    }
    imageViews.animationImages = [imagesArray copy];
    imageViews.animationDuration = 0.9;
    imageViews.animationRepeatCount = 1000000000;
    [imageViews startAnimating];
    [self.view addSubview:imageViews];
}

-(void)dealloc{
    NSLog(@"GifViewController dealloc");
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
