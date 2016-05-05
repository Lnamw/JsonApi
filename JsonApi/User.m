//
//  User.m
//  JsonApi
//
//  Created by Elena Maso Willen on 04/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "User.h"

@implementation User


- (NSString *)firstName:(NSString *)name
{
    NSArray *titleToRemove = @[@"Mr", @"Mrs", @"Ms", @"Dr"];
    NSString *firstName = [[NSString alloc] initWithString:name];
    
    for (int i=0; i < titleToRemove.count; i++) {
        NSRange replaceRange = [firstName rangeOfString:titleToRemove[i]];
        
        if (replaceRange.location != NSNotFound) {
            firstName = [firstName stringByReplacingCharactersInRange:replaceRange withString:@""];
        }
    }
    
    return firstName;
}

- (NSString *)lastName:(NSString *)name
{
    
}




@end
