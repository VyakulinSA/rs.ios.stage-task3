#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if ([ratingArray count] == 0 || [ratingArray count] < 3){
        return 0;
    }
    NSMutableArray<NSArray<NSNumber *>*> *resultArray = [NSMutableArray new];
    
    for (int i = 0; i < [ratingArray count] - 1; i++) {
        for (int j = i + 1; j < [ratingArray count] - 1; j++) {
            for (int k = j + 1; k <= [ratingArray count] - 1; k++) {
                int iInteger = ratingArray[i].intValue;
                int jInteger = ratingArray[j].intValue;
                int kInteger = ratingArray[k].intValue;
                if((iInteger < jInteger && jInteger < kInteger) || (iInteger > jInteger && jInteger > kInteger)){
                        NSMutableArray *mutArray = [NSMutableArray new];
                        [mutArray addObject:ratingArray[i]];
                        [mutArray addObject:ratingArray[j]];
                        [mutArray addObject:ratingArray[k]];
                        [resultArray addObject:mutArray];
                    
                }
            }
        }
    }
    return [resultArray count];
}

@end
