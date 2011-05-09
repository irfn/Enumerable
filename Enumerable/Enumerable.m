//
//  Enumerable.m
//  Enumerable
//
//  Created by Irfan Shah on 06/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Enumerable.h"


@implementation NSArray (Enumerable)

- (NSArray*) select:(SelectionPredicate)criteria{
  NSMutableArray *selections = [[NSMutableArray alloc] init];
  for (id item in self) {
    if(criteria(item))
      [selections addObject:item];
  }
  return selections;
}

- (id) detect:(DetectionPredicate)criteria{
  for (id item in self) {
    if(criteria(item))
      return item;
  }
  return NULL;
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


@end


