//
//  MCMailPreviewCell.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCMailPreviewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *MailSubject;
@property (nonatomic, strong) IBOutlet UILabel *MailDate;
@property (nonatomic, strong) IBOutlet UILabel *MailSenderName;

@end
