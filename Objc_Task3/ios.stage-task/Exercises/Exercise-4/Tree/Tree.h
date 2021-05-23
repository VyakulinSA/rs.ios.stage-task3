//
//  Tree.h
//  ios.stage-task
//
//  Created by Вякулин Сергей on 23.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tree : NSObject

@property(nonatomic)NSNumber *value;
@property(nonatomic)int level;
@property(nonatomic, nullable)Tree *left;
@property(nonatomic, nullable)Tree *right;

- (Tree *)createTree:(NSMutableArray *)treeArray andLevel:(int)level;
- (void)returnNodesArray: (NSMutableDictionary *_Nonnull*_Nonnull)dict;

@end

NS_ASSUME_NONNULL_END
