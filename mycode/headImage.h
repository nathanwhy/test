//
//  headImage.h
//  text2
//
//  Created by DOIT on 14-9-4.
//  Copyright (c) 2014年 nathanwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headImage : UIImageView

@property (nonatomic, copy)void (^block)(headImage *headimage);


//- (void)doSomething;

@end
