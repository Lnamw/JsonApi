//
//  User.h
//  JsonApi
//
//  Created by Elena Maso Willen on 04/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, copy)NSString *firstName;
@property (nonatomic, copy)NSString *lastName;
@property (nonatomic, copy)NSString *fullName;


- (NSString *)firstName:(NSString *)name;
- (NSString *)lastName:(NSString *)name;

@end
