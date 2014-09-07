//
//  MCMailPreviewCellHelper.h
//  MailClient
//
//  Created by Ivan Sevostianov on 9/8/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MailCore.h"
#import "MCMailPreviewCell.h"


@interface MCMailPreviewCellHelper : NSObject

@property(nonatomic, assign) MCMailPreviewCell *Cell;

- (void)startGetMessageOpereation;
- (void) updateCellDataWithSession:(MCOIMAPSession *)pSession cellIndex:(int)iCellIndex cellDataStore:(NSMutableDictionary *)store;
- (id)initWithRefToCell:(MCMailPreviewCell *)cell;

@end
