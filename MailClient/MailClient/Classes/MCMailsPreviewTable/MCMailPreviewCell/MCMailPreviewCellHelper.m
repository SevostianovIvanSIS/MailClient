//
//  MCMailPreviewCellHelper.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/8/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCMailPreviewCellHelper.h"

@implementation MCMailPreviewCellHelper


- (id) initWithRefToCell:(MCMailPreviewCell *)cell{
    self = [super init];
    if (self) {
        [self setCell:cell];
    }
    return self;
}

- (void)startGetMessageOpereation{
    
    
    [[[self Cell] MailSubject] setText:@""];
    [[[self Cell] MailDate] setText:@""];
    [[[self Cell] MailSenderName] setText:@""];
    
    MCOIMAPMessagesRequestKind requestKind = MCOIMAPMessagesRequestKindHeaders;
    NSString *folder = @"INBOX";
    MCOIndexSet *uids = [MCOIndexSet indexSetWithRange:MCORangeMake([[self Cell] CellIndex], [[self Cell] CellIndex])];
    
    MCOIMAPFetchMessagesOperation *fetchOperation = [[[self Cell] Session] fetchMessagesByUIDOperationWithFolder:folder requestKind:requestKind uids:uids];
    
    [[self Cell] setIsActivityIndicatorEnable:YES];
    [[self Cell] setNeedsLayout];
    [[self Cell] setUserInteractionEnabled:NO];
    
    
    [fetchOperation start:^(NSError * error, NSArray * fetchedMessages, MCOIndexSet * vanishedMessages) {
        
        if(error){
            [self startGetMessageOpereation];
            return;
        }
        
        if([fetchedMessages count] > 0){
            MCOIMAPMessage *m = fetchedMessages[0];
            [[self Cell] setUid:m.uid];
            
            [[[self Cell] MailSubject] setText:m.header.subject];
            
            NSString *dateString = [NSDateFormatter localizedStringFromDate:m.header.date
                                                                  dateStyle:NSDateFormatterShortStyle
                                                                  timeStyle:NSDateFormatterFullStyle];
            
            [[[self Cell] MailDate] setText:dateString];
            [[[self Cell] MailSenderName] setText:m.header.sender.displayName];
            
            [[self Cell] setIsActivityIndicatorEnable:NO];
            [[self Cell] setNeedsLayout];
            [[self Cell] setUserInteractionEnabled:YES];
            
            
            NSString *sUidString = [NSString stringWithFormat:@"%d", m.uid];
            
            
            [NSDictionary dictionaryWithObjectsAndKeys:m.header.subject, @"Subject", m.header.sender.displayName, @"Name", dateString, @"DateString", sUidString, @"Uid",   nil];
            
            NSDictionary *pCellData = [NSDictionary dictionaryWithObjectsAndKeys:m.header.subject, @"Subject", m.header.sender.displayName, @"Name", dateString, @"DateString",   nil];
            NSString *intString = [NSString stringWithFormat:@"%d", [[self Cell] CellIndex]];
            [[[self Cell] Store] setObject:pCellData forKey:intString];
            
        }
    }];
}

- (void)updateCellDataWithSession:(MCOIMAPSession *)pSession cellIndex:(int)iCellIndex cellDataStore:(NSMutableDictionary *)store{
    [[self Cell] setSession:pSession];
    [[self Cell] setCellIndex:iCellIndex];
    [[self Cell] setStore:store];
    NSString *intString = [NSString stringWithFormat:@"%d", iCellIndex];
    NSDictionary *pCellData = [[[self Cell] Store] objectForKey:intString];
    if(pCellData == NULL){
        [self startGetMessageOpereation];
    }else{
        NSString *pSubject = [pCellData objectForKey:@"Subject"];
        NSString *pName = [pCellData objectForKey:@"Name"];
        NSString *pDateString = [pCellData objectForKey:@"DateString"];
        NSString *pUid = [pCellData objectForKey:@"Uid"];
        
        [[[self Cell] MailSubject] setText:pSubject];
        [[[self Cell] MailDate] setText:pName];
        [[[self Cell] MailSenderName] setText:pDateString];
        [[self Cell] setUid:[pUid intValue]];
        
    }
}


@end
