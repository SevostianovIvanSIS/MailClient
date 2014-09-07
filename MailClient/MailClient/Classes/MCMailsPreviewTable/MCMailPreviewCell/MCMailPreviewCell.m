//
//  MCMailPreviewCell.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCMailPreviewCell.h"
#import "MCMailPreviewCellHelper.h"

@implementation MCMailPreviewCell

@synthesize MailSubject = m_pMailSubject;
@synthesize MailDate = m_pMailDate;
@synthesize MailSenderName = m_pMailSenderName;
@synthesize Store = m_pStore;

@synthesize CellIndex = m_iCellIndex;

@synthesize ActivityIndicator = m_pActivityIndicator;
@synthesize IsActivityIndicatorEnable = m_bIsActivityIndicatorEnable;
@synthesize Session = m_pSession;
@synthesize Uid = m_iUid;
@synthesize CellHelper = m_pCellHelper;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)awakeFromNib
{
    [self setIsActivityIndicatorEnable:YES];
    MCMailPreviewCellHelper * pHelper = [[MCMailPreviewCellHelper alloc] initWithRefToCell:self];
    [self setCellHelper:pHelper];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    if(![self IsActivityIndicatorEnable]){
        [m_pActivityIndicator setColor:[UIColor clearColor]];
        [m_pActivityIndicator setHidden:YES];
    }else{
        [m_pActivityIndicator setColor:[UIColor grayColor]];
        [m_pActivityIndicator setHidden:NO];
    }
}

- (void)updateCellDataWithSession:(MCOIMAPSession *)pSession cellIndex:(int)iCellIndex cellDataStore:(NSMutableDictionary *)store{
    MCMailPreviewCellHelper *pHelper = (MCMailPreviewCellHelper *)[self CellHelper];
    [pHelper updateCellDataWithSession:pSession cellIndex:iCellIndex cellDataStore:store];
}

@end
