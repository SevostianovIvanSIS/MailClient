//
//  MCEnterEmailViewController.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCEnterEmailViewController.h"
#import "MCConstants.h"
#import "MailCore.h"

@interface MCEnterEmailViewController ()

@end

@implementation MCEnterEmailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToMailsAction:(id)sender{
    
    MCOIMAPSession *session = [[MCOIMAPSession alloc] init];
    [session setHostname:@"imap.gmail.com"];
    [session setPort:993];
    [session setUsername:@"sevostianov.ivan.s.i.s@gmail.com"];
    [session setPassword:@"catalist1990SIS"];
    [session setConnectionType:MCOConnectionTypeTLS];
    
    MCOIMAPMessagesRequestKind requestKind = MCOIMAPMessagesRequestKindHeaders;
    NSString *folder = @"INBOX";
    MCOIndexSet *uids = [MCOIndexSet indexSetWithRange:MCORangeMake(1, 3)];
    
    MCOIMAPFetchMessagesOperation *fetchOperation = [session fetchMessagesByUIDOperationWithFolder:folder requestKind:requestKind uids:uids];
    
    MCOIMAPFolderStatusOperation *_FolderStatusOperation =[session folderStatusOperation:@"INBOX"];
    [_FolderStatusOperation start:^(NSError *error, MCOIMAPFolderStatus *status) {
        uint32_t iMessages = status.messageCount;
        NSLog(@"%u", iMessages);
    }];
    
    [fetchOperation start:^(NSError * error, NSArray * fetchedMessages, MCOIndexSet * vanishedMessages) {
        //We've finished downloading the messages!
        
        
        for (int i = 0; i < [fetchedMessages count]; i++) {
            MCOIMAPMessage *m = fetchedMessages[i];
            
            NSLog(@"%@", m.header.subject);
            NSLog(@"%@", m.header.date);
            NSLog(@"%@", m.header.sender.displayName);
            
            MCOIMAPFetchContentOperation *operation = [session fetchMessageByUIDOperationWithFolder:@"INBOX" uid:m.uid];
            
            [operation start:^(NSError *error, NSData *data) {
                MCOMessageParser *messageParser = [[MCOMessageParser alloc] initWithData:data];
                
                NSString *msgHTMLBody = [messageParser htmlBodyRendering];
//                NSLog(@"%i", i);
            }];
        }
        
        //Let's check if there was an error:
        if(error) {
            NSLog(@"Error downloading message headers:%@", error);
        }
        
        //And, let's print out the messages...
        NSLog(@"The post man delivereth:%@", fetchedMessages);
    }];
    
    
    
    
    
    [self performSegueWithIdentifier:kToMailSegueId sender:self];
}

@end
