//
//  Enumerable.h
//  Enumerable
//
//  Created by Irfan Shah on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Enumerable)

typedef BOOL (^ BooleanPredicate)(id item);
typedef id (^ItemPredicate)(id item);
- (BOOL) isAnyMatching:(BooleanPredicate) criteria;
- (BOOL) areAllMatching:(BooleanPredicate) criteria;

- (NSArray*) select:(BooleanPredicate) criteria;
- (NSArray*) collect:(ItemPredicate) itemPredicate;
- (id) detect:(BooleanPredicate) criteria;

@end

