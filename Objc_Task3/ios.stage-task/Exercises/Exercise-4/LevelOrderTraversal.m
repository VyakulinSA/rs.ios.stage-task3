#import "LevelOrderTraversal.h"
#import "Tree.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableDictionary *resultDict = [NSMutableDictionary new];
    NSMutableArray *resultArray = [NSMutableArray new];

    Tree *myTree = [[Tree alloc] createTree:[tree mutableCopy] andLevel:0];
    [myTree returnNodesArray:&resultDict];
    
    for (int i = 0; i < [resultDict count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%d",i];
        [resultArray addObject:resultDict[key]];
    }

    return resultArray;
}
