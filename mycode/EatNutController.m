//
//  EatNutController.m
//  mycode
//
//  Created by DOIT on 14-9-29.
//  Copyright (c) 2014年 nathanwu. All rights reserved.
//
//  ----吃豆人---
//画一个吃豆人开口的路径：pacmanOpenPath
//画一个吃豆人闭口的路径：pacmanClosedPath
//新建一个闭口的吃豆人头的层：shapeLayer

//把开口和闭口路径设置成CABasicAnimation *chompAnimation动画的起点和终点，这样循环就能出现咬牙的动画了。

//最后设置一个路径为关键帧，让吃豆人在这条路径上行动。
//
//


#import "EatNutController.h"
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)
@interface EatNutController ()
{
    UIBezierPath *pacmanOpenPath;
    UIBezierPath *pacmanClosedPath;
    CAShapeLayer *shapeLayer;
}
@end

@implementation EatNutController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)animationInit
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat radius = 30.0f;
    CGFloat diameter = radius * 2;
    CGPoint arcCenter = CGPointMake(radius, radius);
    // Create a UIBezierPath for Pacman's open state
    // 从3点开始算angle，clockwise顺势针
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                    radius:radius
                                                startAngle:DEGREES_TO_RADIANS(35)
                                                  endAngle:DEGREES_TO_RADIANS(315)
                                                 clockwise:YES];
    // 起始点开始顺势针
    [pacmanOpenPath addLineToPoint:arcCenter];
    [pacmanOpenPath closePath];
    
    // Create a UIBezierPath for Pacman's close state
    pacmanClosedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                      radius:radius
                                                  startAngle:DEGREES_TO_RADIANS(1)
                                                    endAngle:DEGREES_TO_RADIANS(359)
                                                   clockwise:YES];
    [pacmanClosedPath addLineToPoint:arcCenter];
    [pacmanClosedPath closePath];
    
    // Create a CAShapeLayer for Pacman, fill with yellow
    shapeLayer             = [CAShapeLayer layer];
    shapeLayer.fillColor   = [UIColor yellowColor].CGColor;
    shapeLayer.path        = pacmanClosedPath.CGPath;
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.lineWidth   = 1.0f;
    shapeLayer.bounds      = CGRectMake(0, 0, diameter, diameter);
    shapeLayer.position    = CGPointMake(-40, -100);
    [self.view.layer addSublayer:shapeLayer];
    
    SEL startSelector = @selector(startAnimation);
    UIGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:startSelector];
    [self.view addGestureRecognizer:recognizer];
}


- (void)startAnimation {
    // 创建咬牙动画
    CABasicAnimation *chompAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    chompAnimation.duration       = 0.25;
    chompAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    chompAnimation.repeatCount    = HUGE_VALF;
    chompAnimation.autoreverses   = YES;
    // Animate between the two path values
    chompAnimation.fromValue      = (id)pacmanClosedPath.CGPath;
    chompAnimation.toValue        = (id)pacmanOpenPath.CGPath;
    [shapeLayer addAnimation:chompAnimation forKey:@"chompAnimation"];
    
    // Create digital '2'-shaped path
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(300, 100)];
    [path addLineToPoint:CGPointMake(300, 200)];
    [path addLineToPoint:CGPointMake(0, 200)];
    [path addLineToPoint:CGPointMake(0, 300)];
    [path addLineToPoint:CGPointMake(300, 300)];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = 8.0f;
    // Setting the rotation mode ensures Pacman's mouth is always forward.  This is a very convenient CA feature.
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    [shapeLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
}


@end
