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
    NSArray *titleToRemove = @[@"Mr. ", @"Mrs. ", @"Ms. ", @"Dr. "];

    self.fullName = name;
    
    for (int i=0; i < titleToRemove.count; i++) {
        NSRange replaceRange = [self.fullName rangeOfString:titleToRemove[i]];
        
        if (replaceRange.location != NSNotFound) {
            self.fullName = [self.fullName stringByReplacingCharactersInRange:replaceRange withString:@""];
        }
    }
    
    
    NSArray *nameArray = [self.fullName componentsSeparatedByString:@" "];
    
    self.firstName = [nameArray objectAtIndex:0];

    return self.firstName;
    return self.fullName;
}

- (NSString *)lastName:(NSString *)name
{
    NSArray *nameArray = [self.fullName componentsSeparatedByString:@" "];
    
    self.lastName = [nameArray objectAtIndex:1];
    
    return self.lastName;
}




@end
