//
//  MCEnterEmailView.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCEnterEmailView : UIView

@property (nonatomic, strong) IBOutlet UITextField *EmailTextField;
@property (nonatomic, strong) IBOutlet UITextField *PasswordTextField;
@property (nonatomic, strong) IBOutlet UIButton *GoToMailsButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *ActivityIndicator;

@end
