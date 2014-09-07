//
//  MCEnterEmailView.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCEnterEmailView.h"

@implementation MCEnterEmailView

@synthesize EmailTextField = m_pEmailTextField;
@synthesize PasswordTextField = m_pPasswordTextField;
@synthesize GoToMailsButton = m_pGoToMailsButton;
@synthesize ActivityIndicator = m_pActivityIndicator;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
