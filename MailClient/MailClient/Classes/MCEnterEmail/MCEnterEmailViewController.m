//
//  MCEnterEmailViewController.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCEnterEmailViewController.h"
#import "MCConstants.h"
#import "MCEnterEmailView.h"
#import "MCMailPreviewTableViewController.h"


@interface MCEnterEmailViewController ()

@end

@implementation MCEnterEmailViewController

@synthesize Session = m_pSession;
@synthesize MesaagesCount = m_pMessagesCount;

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
    
    MCEnterEmailView *pView = (MCEnterEmailView *)[self view];
    NSString *pEmail = [[pView EmailTextField] text];
    NSString *pPassword = [[pView PasswordTextField] text];
    
    if([pEmail  isEqual: @""] || [pPassword  isEqual: @""]){
        UIAlertView* pErrorView = [[UIAlertView alloc]
                                   initWithTitle:@"Error"
                                   message:@"You must enter Email and password!"
                                   delegate:NULL
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
        
        [pErrorView show];
        return;
    }
    
    [[pView GoToMailsButton] setEnabled:NO];
    [pView setIsActivityIndicatorEnable:YES];
    [pView setNeedsLayout];
    
    if(![self Session]){
        m_pSession = [[MCOIMAPSession alloc] init];
        [m_pSession setHostname:@"imap.gmail.com"];
        [m_pSession setPort:993];
        [m_pSession setUsername:pEmail];
        [m_pSession setPassword:pPassword];
        [m_pSession setConnectionType:MCOConnectionTypeTLS];
    }
    
    
    MCOIMAPFolderStatusOperation *pFolderStatusOperation =[[self Session] folderStatusOperation:@"INBOX"];
    [pFolderStatusOperation start:^(NSError *error, MCOIMAPFolderStatus *status) {
        
        [pView setIsActivityIndicatorEnable:false];
        [pView setNeedsLayout];
        
        if(error){
            UIAlertView* pErrorView = [[UIAlertView alloc]
                                       initWithTitle:@"Error"
                                       message:@"Fail get message count!"
                                       delegate:NULL
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
            
            [pErrorView show];
            [[pView GoToMailsButton] setEnabled:YES];
            [pView setIsActivityIndicatorEnable:false];
            [pView setNeedsLayout];
            
            [self setSession:NULL];
            
            return;
        }
        m_pMessagesCount = status.messageCount;
        [self performSegueWithIdentifier:kToMailSegueId sender:self];
    }];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kToMailSegueId]) {
        MCMailPreviewTableViewController *destViewController = segue.destinationViewController;
        [destViewController setMesaagesCount:[self MesaagesCount]];
        [destViewController setSession:[self Session]];
        [[destViewController tableView] reloadData];
    }
}

@end
