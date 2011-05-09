//
//  Enumerable.m
//  Enumerable
//
//  Created by Irfan Shah on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Enumerable.h"


@implementation NSArray (Enumerable)

- (BOOL) isAnyMatching:(BooleanPredicate)criteria{
  for (id item in self) {
    if(criteria(item))
      return YES;
  }
  return NO;
}

- (BOOL) areAllMatching:(BooleanPredicate)criteria{
  for (id item in self) {
    if(!criteria(item))
      return NO;
  }
  return YES;
}

- (NSArray*) collect:(ItemPredicate)itemPredicate{
  NSMutableArray *collections = [[NSMutableArray alloc] init];
  for (id item in self) {
    id translatedObject = itemPredicate(item);
    if(translatedObject != NULL)
      [collections addObject:translatedObject];
  }
  return collections;
}

-(NSInteger)count:(BooleanPredicate)criteria{
  return [[self select:criteria] count];
}

- (NSArray*) select:(BooleanPredicate)criteria{
  NSMutableArray *selections = [[NSMutableArray alloc] init];
  for (id item in self) {
    if(criteria(item))
      [selections addObject:item];
  }
  return selections;
}

- (id) detect:(BooleanPredicate)criteria{
  for (id item in self) {
    if(criteria(item))
      return item;
  }
  return NULL;
}

-(NSArray *)drop:(NSInteger)number{
  return [self subarrayWithRange:NSMakeRange(number, [self count] - number)];
}
@end


