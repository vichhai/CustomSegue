//
//  Dictionary.h
//  CustomSegue
//
//  Created by vichhai on 7/9/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Dictionary : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * meaning;
@property (nonatomic, retain) NSString * part_of_speach;

@end
