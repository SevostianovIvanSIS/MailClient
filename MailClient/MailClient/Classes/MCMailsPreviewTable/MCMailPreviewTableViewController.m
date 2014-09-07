//
//  MCMailPreviewTableViewController.m
//  MailClient
//
//  Created by Ivan Sevostianov on 9/7/14.
//  Copyright (c) 2014 Sevostianov. All rights reserved.
//

#import "MCMailPreviewTableViewController.h"
#import "MCConstants.h"
#import "MCMailPreviewCell.h"
#import "MCDetailMailViewController.h"

@interface MCMailPreviewTableViewController ()

@end

@implementation MCMailPreviewTableViewController

@synthesize Session = m_pSession;
@synthesize MesaagesCount = m_pMessagesCount;
@synthesize Store = m_pStore;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (id)init{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *pStore = [[NSMutableDictionary alloc] init];
    [self setStore:pStore];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[self Store] removeAllObjects];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self MesaagesCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MCMailPreviewCell *cell = (MCMailPreviewCell *)[tableView dequeueReusableCellWithIdentifier:kMCMailPreviewCellId forIndexPath:indexPath];
    
    [cell updateCellDataWithSession:[self Session] cellIndex:[indexPath row] cellDataStore:[self Store]];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kToDetailViewSegueId]) {
        MCMailPreviewCell *pCell = (MCMailPreviewCell *)sender;
        MCDetailMailViewController *destViewController = segue.destinationViewController;
        [destViewController setUid:[pCell Uid]];
        [destViewController setSession:[self Session]];
        [destViewController setName:[[pCell MailSenderName] text]];
        [destViewController setSubject:[[pCell MailSubject] text]];
        [destViewController setDateString:[[pCell MailDate] text]];
        
        [destViewController updateContent];
    }
}


@end
