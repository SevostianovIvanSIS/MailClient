//
//  MCDetailMailViewController.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MailCore.h"

@interface MCDetailMailViewController : UIViewController
@property(nonatomic, strong) MCOIMAPSession *Session;
@property (nonatomic, assign) uint32_t Uid;

@property(nonatomic, strong) NSString *Subject;
@property(nonatomic, strong) NSString *Name;
@property(nonatomic, strong) NSString *DateString;


-(void)updateContent;

@end
