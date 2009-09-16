//
//  FirstViewController.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/14/09.
//  Copyright Topfunky Corporation 2009. All rights reserved.
//

#import "TFWebViewController.h"
#import "../Models/TFNewsItem.h"
#import "../Helpers/TFAppHelpers.h"

@implementation TFWebViewController

@synthesize webView, newsItem;

- (id)initWithNewsItem:(TFNewsItem *)theNewsItem
{
  if (![super initWithNibName:@"TFWebView" bundle:nil])
    return nil;

  self.newsItem = theNewsItem;
  self.title = newsItem.title;
  return self;
}

- (void)viewDidLoad {
  if (newsItem)
    [self goToURL:newsItem.url];
  [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  // Release any retained subviews of the main view.
  self.webView = nil;
}

#pragma mark Web Delegate

//- (void)webViewDidStartLoad:(UIWebView *)webView
//{
//}

//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
  TFAlertWithErrorAndDelegate(error, self);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark Browser Navigation

- (void)goToURL:(NSURL *)aURL
{
  NSURLRequest *request = [NSURLRequest requestWithURL:aURL];
  [webView loadRequest:request];
}

#pragma mark Dealloc

- (void)dealloc {
  [webView release];
  [newsItem release];
  [super dealloc];
}

@end
