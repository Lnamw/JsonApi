//
//  Adress.h
//  JsonApi
//
//  cated by Elena Maso Willen on 05/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Geo;

@interface Adress : NSObject

@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *suite;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *zipcode;

@property (nonatomic, strong) Geo *fullGeo;

@end
