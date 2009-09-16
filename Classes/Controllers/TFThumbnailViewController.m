//
//  TFThumbnailViewController.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/14/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import "TFThumbnailViewController.h"
#import "TFWebViewController.h"

@implementation TFThumbnailViewController

@synthesize newsItems, activityIndicator;

- (void)loadView
{
  TFThumbnailView *thumbnailView = [[TFThumbnailView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] 
                                                delegate:self];
  self.view = thumbnailView;
  [thumbnailView release];

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

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	 // Release any retained subviews of the main view.
  self.activityIndicator = nil;
}

- (void)loadData
{
  if (newsItems == nil)
  {
    [activityIndicator startAnimating];
    [TFNewsItem loadRecentWithDelegate:self]; 
  } else {
    [self receivedNewsItems:newsItems];
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
  return YES;
}


#pragma mark TFNewsItemDelegate Methods

- (void)receivedNewsItems:(NSArray *)theNewsItems
{
  self.newsItems = theNewsItems;
  [(TFThumbnailView *)self.view updateContent:theNewsItems];
  [activityIndicator stopAnimating];
}

#pragma mark TFThumbnailViewDelegate Methods

- (void)didClickOnItem:(id<TFThumbnailViewDataItem>)theItem
{
  TFNewsItem *newsItem = (TFNewsItem *)theItem;

  TFWebViewController *webViewController = [[TFWebViewController alloc] initWithNewsItem:newsItem];
  [self.navigationController pushViewController:webViewController animated:YES];
  [webViewController release];
}

#pragma mark Dealloc

- (void)dealloc {
  [newsItems release];
  [activityIndicator release];
  [super dealloc];
}


@end



