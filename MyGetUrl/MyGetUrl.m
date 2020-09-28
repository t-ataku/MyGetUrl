//
//  MyGetUrl.m
//  MyGetUrl
//
//  Created by Toshimi Ataku on 2020/09/28.
//  Copyright © 2020 Toshimi Ataku. All rights reserved.
//

#import "MyGetUrl.h"

@implementation MyGetUrl

- (IBAction)doGotChallenge:(id)sender {
    if (sender == nil)
        return;
    id docview = [_contents documentView];
    NSRange range = NSMakeRange(0, [[docview string] length]);
    [docview replaceCharactersInRange:range withString:sender];
}

- (IBAction)doFetch:(id)sender {
    NSLog(@"url:%@", [_url stringValue]);

    id url = [NSURL URLWithString: [_url stringValue]];

    NSURLSessionDataTask *dtask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:
                                       ^(NSData *_dt, NSURLResponse *_resp, NSError *error) {
            if (_dt == nil) {
                NSLog(@"%@", error);
                return;
            }
            NSLog(@"DataLen=%lu", (unsigned long)[_dt length]);
//            NSString *data = [[NSString alloc] initWithBytes:[_dt bytes] length:[_dt length] encoding:NSJapaneseEUCStringEncoding];
            NSString *data = [[NSString alloc] initWithBytes:[_dt bytes] length:[_dt length] encoding:NSUTF8StringEncoding];

    //        NSLog(@"%@", _resp);
    //        NSLog(@"%@", data);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self doGotChallenge:data];
            });
        }];

    [dtask resume];
}

@end
