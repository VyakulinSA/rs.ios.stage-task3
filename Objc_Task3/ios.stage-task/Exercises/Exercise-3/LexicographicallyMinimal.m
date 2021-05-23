#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *myString1 = [[NSMutableString alloc] initWithString:string1];
    NSMutableString *myString2 = [[NSMutableString alloc] initWithString:string2];
    NSMutableString *resultString = [NSMutableString new];
    
    while (myString1.length > 0 || myString2.length > 0) {
        NSComparisonResult comparisonRes = [myString1 compare:myString2];
        if((comparisonRes == NSOrderedAscending && [myString1 length] != 0) || (comparisonRes == NSOrderedDescending && [myString2 length] == 0)){
            [resultString appendString:[myString1 substringToIndex:1]];
            [myString1 deleteCharactersInRange:NSMakeRange(0, 1)];
        }else {
            [resultString appendString:[myString2 substringToIndex:1]];
            [myString2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }

    return resultString;
}

@end
