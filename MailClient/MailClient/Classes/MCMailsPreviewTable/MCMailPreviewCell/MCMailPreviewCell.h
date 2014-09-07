//
//  MCMailPreviewCell.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MailCore.h"


@interface MCMailPreviewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *MailSubject;
@property (nonatomic, strong) IBOutlet UILabel *MailDate;
@property (nonatomic, strong) IBOutlet UILabel *MailSenderName;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *ActivityIndicator;

@property (nonatomic, assign) BOOL IsActivityIndicatorEnable;
@property (nonatomic, assign) int CellIndex;
@property (nonatomic, assign) NSMutableDictionary * Store;

@property (nonatomic, assign) uint32_t Uid;

@property(nonatomic, strong) MCOIMAPSession *Session;

@property(nonatomic, strong) NSObject *CellHelper;

- (void) updateCellDataWithSession:(MCOIMAPSession *)pSession cellIndex:(int)iCellIndex cellDataStore:(NSMutableDictionary *)store;

@end
