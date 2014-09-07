//
//  MCEnterEmailViewController.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MailCore.h"

@interface MCEnterEmailViewController : UIViewController

@property(nonatomic, strong) MCOIMAPSession *Session;
@property (nonatomic, assign) uint32_t MesaagesCount;

- (IBAction)goToMailsAction:(id)sender;

@end
