//
//  Enumerable.h
//  Enumerable
//
//  Created by Irfan Shah on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Enumerable)

typedef BOOL (^SelectionPredicate)(id item);
typedef BOOL (^DetectionPredicate)(id item);
typedef id (^ItemPredicate)(id item);

- (NSArray*) select:(SelectionPredicate) criteria;
- (id) detect:(DetectionPredicate) criteria;
- (NSArray*) collect:(ItemPredicate) itemPredicate;

@end

