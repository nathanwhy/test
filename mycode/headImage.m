//
//  headImage.m
//  text2
//
//  Created by DOIT on 14-9-4.
//  Copyright (c) 2014年 nathanwu. All rights reserved.
//

#import "headImage.h"

@implementation headImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainClick)]];
    }
    return self;
}


- (void)mainClick
{
    if (_block) {
        _block(self);
        //_block();
    }
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
