//
//  MCDetailMailView.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCDetailMailView : UIView

@property (nonatomic, strong) IBOutlet UIWebView *MailContentView;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *ActivityIndicator;

@property (nonatomic, assign) BOOL IsActivityIndicatorEnable;

@end
