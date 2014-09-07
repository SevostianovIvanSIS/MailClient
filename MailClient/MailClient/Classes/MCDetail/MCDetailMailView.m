//
//  MCDetailMailView.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCDetailMailView.h"

@implementation MCDetailMailView

@synthesize MailContentView = m_pMailContentView;
@synthesize ActivityIndicator = m_pActivityIndicator;
@synthesize IsActivityIndicatorEnable = m_bIsActivityIndicatorEnable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init{
    self = [super init];
    if (self) {
        [self setIsActivityIndicatorEnable:YES];
    }
    return self;
}


- (void)layoutSubviews{
    if(![self IsActivityIndicatorEnable]){
        [m_pActivityIndicator setColor:[UIColor clearColor]];
        [m_pActivityIndicator setHidden:YES];
    }else{
        [m_pActivityIndicator setColor:[UIColor grayColor]];
        [m_pActivityIndicator setHidden:NO];
    }
    
    for (UIView *aView in [[self MailContentView] subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            UIScrollView* scView = (UIScrollView *)aView;
            
            [scView setShowsHorizontalScrollIndicator:NO];
            scView.bounces = NO;
            
            for (UIView *shadowView in aView.subviews)
            {
                if ([shadowView isKindOfClass:[UIImageView class]])
                {
                    shadowView.hidden = YES;
                }
            }
        }
    }
}

@end
