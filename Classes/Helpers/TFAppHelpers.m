//
//  TFAppHelpers.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/18/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import "TFAppHelpers.h"


void TFLogRect(NSString *message, CGRect rect)
{
  NSLog(@"%@ {x:%0.1f, y:%0.1f, width:%0.1f, height:%0.1f}", message, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

void TFLogSize(NSString *message, CGSize size)
{
  NSLog(@"%@ {width:%0.1f, height:%0.1f}", message, size.width, size.height);
}


void TFAlertWithMessageAndDelegate(NSString *message, id theDelegate)
{
	/* Show an alert with an OK button */
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"News App" 
                                                  message:message
                                                 delegate:theDelegate 
                                        cancelButtonTitle:@"OK" 
                                        otherButtonTitles: nil];
	[alert show];
	[alert release];
}

void TFAlertWithErrorAndDelegate(NSError *error, id theDelegate)
{
  NSString *message = [@"Sorry, " stringByAppendingString:[error localizedDescription]];
  TFAlertWithMessageAndDelegate(message, theDelegate);
}
