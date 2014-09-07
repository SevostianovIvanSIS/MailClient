//
//  MCMailPreviewTableViewController.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MailCore.h"

@interface MCMailPreviewTableViewController : UITableViewController

@property (nonatomic, strong) NSString *Email;
@property (nonatomic, strong) NSString *Password;
@property (nonatomic, assign) uint32_t MesaagesCount;

@property(nonatomic, strong) MCOIMAPSession *Session;
@property (nonatomic, strong) NSMutableDictionary * Store;

@end
