#import <Cedar/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "Enumerable.h"
#define array(items...) [[NSMutableArray alloc] initWithObjects:items, nil]
SPEC_BEGIN(EnumerableSpec)

describe(@"Enumerable", ^{
    
  it(@"should detect first item matching predicate", ^{
    NSString *detectedItem = [ array(@"a", @"b") detect:^(NSString *item){
      return [item isEqualToString:@"a"];
    }];
      
    assertThat(detectedItem, equalTo(@"a"));
  });
  
  it(@"should verify any item matching predicate", ^{
    BOOL matching = [ array(@"a", @"b") isAnyMatching:^(NSString *item){
      return [item isEqualToString:@"a"];
    }];
    
    assertThatBool(matching, equalToBool(TRUE));
  });
  

  it(@"should collect non NULL items returned from predicate", ^{
    NSArray *collectedItems = [ array(@"a", @"a") collect:^(NSString *item){
      return [item isEqualToString:@"a"] ? [NSString stringWithFormat:@"transformed %@", item] : NULL;
    }];
    
    assertThat(collectedItems, equalTo(array(@"transformed a", @"transformed a")));
  });

  it(@"should select items matching predicate", ^{
    NSArray *collectedItems = [array(@"a", @"b", @"c", @"a") select:^(NSString *item){
      return [item isEqualToString:@"a"]; 
    }];
    
    assertThat(collectedItems, equalTo(array(@"a", @"a")));
  });
  
  it(@"should verify all items match", ^{
   BOOL allDonotMatch = [array(@"a", @"b", @"c", @"a") areAllMatching:^(NSString *item){
      return [item isEqualToString:@"a"]; 
    }];
    assertThatBool(allDonotMatch, equalToBool(NO));
    BOOL allMatch = [array(@"a", @"b", @"c", @"a") areAllMatching:^(NSString *item){
      return YES; 
    }];
    assertThatBool(allMatch, equalToBool(YES));

  });
  
});
SPEC_END

