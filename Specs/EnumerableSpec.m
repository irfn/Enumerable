#import <Cedar/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "Enumerable.h"

SPEC_BEGIN(EnumerableSpec)

describe(@"Enumerable", ^{
  
  it(@"should detect", ^{
    NSString *detectedItem = [ [[NSMutableArray alloc] initWithObjects:@"a",@"b", nil] detect:^(NSString *item){
      return [item isEqualToString:@"a"];
    }];
    
    assertThat(detectedItem, equalTo(@"a"));
  });

  
  it(@"should collect", ^{
    NSArray *collectedItems = [[[NSMutableArray alloc] initWithObjects:@"a",@"b", @"a", nil] collect:^(NSString *item){
      return [item isEqualToString:@"a"] ? [NSString stringWithFormat:@"transformed %@", item] : NULL;
    }];
    
    assertThat(collectedItems, equalTo([[NSMutableArray alloc]  initWithObjects:@"transformed a", @"transformed a", nil]));
  });

  it(@"should select", ^{
    NSArray *collectedItems = [[[NSMutableArray alloc] initWithObjects:@"a",@"b", @"a", nil] select:^(NSString *item){
      return [item isEqualToString:@"a"]; 
    }];
    
    assertThat(collectedItems, equalTo([[NSMutableArray alloc]  initWithObjects:@"a", @"a", nil]));
  });
  
});
SPEC_END

