//
//  AnimationModel.h
//  animation_demo
//
//  Created by zhanqin on 2018/6/19.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationModel : NSObject

@property(nonatomic,strong) NSArray * images;
@property(nonatomic,assign) float fromX;
@property(nonatomic,assign) float fromY;
@property(nonatomic,assign) float toX;
@property(nonatomic,assign) float toY;
@property(nonatomic,assign) BOOL loop;
@property(nonatomic,assign) float time;

@end
