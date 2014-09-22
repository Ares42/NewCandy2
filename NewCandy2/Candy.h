//
//  Candy.h
//  NewCandy2
//
//  Created by Luke Solomon on 9/21/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Candy : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSData * image;

@end
