//
//  TFNewsListTableViewController.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/15/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import "TFNewsListTableViewController.h"
#import "TFNewsDetailTableViewController.h"

@interface TFNewsListTableViewController (PrivateMethods)
- (void)loadData;
- (void)removeNewsItemsObservers;
- (void)prepareCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
@end

@implementation TFNewsListTableViewController

@synthesize newsItems, activityIndicator;

- (void)viewDidLoad
{
  UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
  indicator.hidesWhenStopped = YES;
  [indicator stopAnimating];
  self.activityIndicator = indicator;
  [indicator release];
  
  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:indicator];
  self.navigationItem.rightBarButtonItem = rightButton;
  [rightButton release];
}

- (void)viewDidAppear:(BOOL)animated
{
  [self loadData];
  [super viewDidAppear:animated];
}

#pragma mark Data Loading Methods

- (void)loadData
{
  if (newsItems == nil)
  {
    [activityIndicator startAnimating];
    [TFNewsItem loadRecentWithDelegate:self];
  } else {
    [self.tableView reloadData];
  }
}


- (void)receivedNewsItems:(NSArray *)theNewsItems
{
  if (newsItems != theNewsItems)
  {
    [self removeNewsItemsObservers];
    self.newsItems = theNewsItems;
    for (id newsItem in newsItems)
    {
      [newsItem addObserver:self 
                 forKeyPath:@"image" 
                    options:0 
                    context:@"imageChanged"];
    }
  }

  [self.tableView reloadData];
  [activityIndicator stopAnimating];
}

- (void)removeNewsItemsObservers
{
  for (id newsItem in newsItems)
  {
    [newsItem removeObserver:self 
                  forKeyPath:@"image"];
  }  
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
  if ([keyPath isEqualToString:@"image"])
  {
    NSUInteger itemIndex  = [newsItems indexOfObject:object];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:itemIndex 
                                                                                     inSection:0]];
    if (cell)
    {
      cell.imageView.image = [(TFNewsItem *)object thumbnailImage];
    }
  }
}


#pragma mark Supporting Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
  return YES;
}


- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section 
{
  return [newsItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                   reuseIdentifier:CellIdentifier] autorelease];
  }

  [self prepareCell:cell 
       forIndexPath:indexPath];

  return cell;
}


- (void)prepareCell:(UITableViewCell *)cell 
       forIndexPath:(NSIndexPath *)indexPath
{
  TFNewsItem *newsItem = [newsItems objectAtIndex:indexPath.row];
  cell.textLabel.text = newsItem.title;
  cell.detailTextLabel.text = newsItem.text;
  cell.imageView.image = [newsItem thumbnailImage];
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}


- (void)tableView:(UITableView *)tableView 
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
  TFNewsItem *newsItem = [newsItems objectAtIndex:indexPath.row];
  TFNewsDetailTableViewController *nextController = [[TFNewsDetailTableViewController alloc] initWithNewsItem:newsItem];
  [self.navigationController pushViewController:nextController animated:YES];
  [nextController release];
}

#pragma mark Dealloc

- (void)dealloc
{
  [self removeNewsItemsObservers];
  [newsItems release];
  [activityIndicator release];
  [super dealloc];
}

@end
