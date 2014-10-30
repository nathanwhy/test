//
//  CircleViewController.m
//  mycode
//
//  Created by nathan on 14-10-30.
//  Copyright (c) 2014年 nathanwu. All rights reserved.
//

// 圆形手势识别

#import "CircleViewController.h"



@interface CircleViewController ()

@end

@implementation CircleViewController

{
    NSInteger level;
    CGPoint   oldPoint;
    CGPoint   newPoint;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"start");
    level = 0;
    UITouch *touch = [touches anyObject];
    newPoint = [touch locationInView:self.view];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    oldPoint = newPoint;
    newPoint = [touch locationInView:self.view];
    
    if (level==0 && newPoint.y > oldPoint.y && newPoint.x < oldPoint.x) {
        level += 1;
    }
    
    if (level==1 && newPoint.y > oldPoint.y && newPoint.x > oldPoint.x) {
        level += 1;
    }
    if (level==2 && newPoint.y < oldPoint.y && newPoint.x > oldPoint.x) {
        level += 1;
    }
    if (level==3 && newPoint.y < oldPoint.y && newPoint.x < oldPoint.x) {
        level += 1;
    }
    
    if (4 == level) {
        level = 0;
        NSLog(@"successs");
    }
}

@end
