//
//  MCDetailMailViewController.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCDetailMailViewController.h"
#import "MCDetailMailView.h"

@interface MCDetailMailViewController ()

@end

@implementation MCDetailMailViewController

@synthesize Session = m_pSession;
@synthesize Uid = m_iUid;

@synthesize DateString = m_pDateString;
@synthesize Name = m_pName;
@synthesize Subject = m_pSubject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)updateContent{
    MCOIMAPFetchContentOperation *operation = [[self Session] fetchMessageByUIDOperationWithFolder:@"INBOX" uid:[self Uid]];
    
    [operation start:^(NSError *error, NSData *data) {
        
        if (error) {
            [self updateContent];
            return;
        }
        
        MCOMessageParser *messageParser = [[MCOMessageParser alloc] initWithData:data];
        
        NSString *msgHTMLBody  = @"";
        
        
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"<FONT COLOR=\"#5C5C5C\" face=\"helvetica neue\">"];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"Date:   "];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:[self DateString]];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"<br>"];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"Subject:  "];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:[self Subject]];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"<br>"];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"Name:  "];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:[self Name]];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"<br>"];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"</FONT>"];
        msgHTMLBody = [msgHTMLBody stringByAppendingString:@"<br>"];
        
        msgHTMLBody = [msgHTMLBody stringByAppendingString:[messageParser htmlBodyRendering]];
        
        MCDetailMailView *pView = (MCDetailMailView *)[self view];
        [[pView MailContentView] loadHTMLString:msgHTMLBody baseURL:nil];
        
        [pView setIsActivityIndicatorEnable:NO];
        [pView setNeedsLayout];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
