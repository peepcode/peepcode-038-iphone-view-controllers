//
//  TFNewsDetailTableViewController.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/17/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import "TFNewsDetailTableViewController.h"
#import "TFWebViewController.h"
#import "../Models/TFNewsItem.h"
#import "../Views/TFParagraphCell.h"
#import "../Helpers/TFAppHelpers.h"


typedef enum {
  TFNewsDetailTitleIndex,
  TFNewsDetailFromUserIndex,
  TFNewsDetailURLIndex,
  TFNewsDetailTextIndex
} TFNewsDetailIndices;


@interface TFNewsDetailTableViewController (PrivateMethods)
- (void)prepareCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
@end


@implementation TFNewsDetailTableViewController

@synthesize newsItem;

- (id)initWithNewsItem:(TFNewsItem *)theNewsItem
{
  if (![super initWithStyle:UITableViewStyleGrouped])
    return nil;

  self.newsItem = theNewsItem;
  self.title    = theNewsItem.title;

  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];

  UIImage *image = [newsItem image];
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 
                                                                         0.0f, 
                                                                         image.size.width, 
                                                                         image.size.height)];
  imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
  imageView.image = image;
  self.tableView.tableFooterView = imageView;
  [imageView release];
}


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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  static NSString *CellIdentifier = @"Cell";
  static NSString *ParagraphCellIdentifier = @"TFParagraphCell";

  if (indexPath.row == TFNewsDetailTextIndex) {
    TFParagraphCell *cell = (TFParagraphCell *)[tableView dequeueReusableCellWithIdentifier:ParagraphCellIdentifier];
    if (cell == nil) {
      cell = [[[TFParagraphCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:ParagraphCellIdentifier] autorelease];
    }
    [self prepareCell:cell forIndexPath:indexPath];
    return cell;
  }

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
  }

  [self prepareCell:cell forIndexPath:indexPath];
  return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == TFNewsDetailTextIndex)
    {
      return [TFParagraphCell heightForCellWithText:newsItem.text
                                            inFrame:self.view.frame];
    }

  return 44.0f;
}


- (void)prepareCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.row)
    {
    case TFNewsDetailTitleIndex:
      cell.textLabel.text = @"title";
      cell.detailTextLabel.text = newsItem.title;
      break;
    case TFNewsDetailTextIndex:
      cell.detailTextLabel.text = newsItem.text;
      break;
    case TFNewsDetailFromUserIndex:
      cell.textLabel.text = @"from user";
      cell.detailTextLabel.text = newsItem.fromUser;
      break;
    case TFNewsDetailURLIndex:
      cell.textLabel.text = @"url";
      cell.detailTextLabel.text = [newsItem.url absoluteString];
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
      break;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == TFNewsDetailURLIndex)
    {
      TFWebViewController *webViewController = [[TFWebViewController alloc] initWithNewsItem:newsItem];
      [self.navigationController pushViewController:webViewController animated:YES];
      [webViewController release];
    }
}


#pragma mark Dealloc

- (void)dealloc {
  [newsItem release];
  [super dealloc];
}

@end
