//
//  Tree.m
//  ios.stage-task
//
//  Created by Вякулин Сергей on 23.05.2021.
//

#import "Tree.h"

@implementation Tree

//инициализируем дерево с левой и правой веткой + значение корня + уровня ветки
- (instancetype)initWithValue:(NSNumber *)value{
    self = [super init];
    
    if (self){
        self.value = value;
        self.level = 0;
        self.left = nil;
        self.right = nil;
    }

    return self;
}

//реализуем метод создания дерева с двумя ветками по переданному массиву
- (Tree *)createTree:(NSMutableArray *)treeArray andLevel:(int)level{
    //если массив пустой, дерево или ветка не существует
    if([treeArray count] == 0){
        return nil;
    }else if(treeArray[0] == [NSNull null]){
        //если в массиве элемент равен null, то ветка не существует
        [treeArray removeObjectAtIndex:0];
        return nil;
    }else{
        //если все хорошо инициализируем дерево\ветку с корнем root
        Tree *root = [[Tree alloc] initWithValue:treeArray[0]];
        root.level += level; //увеличиваем уровень на передаваемый (передается уровень + 1)
        //удаляем элемент из массива, т.к. мы его использовали
        [treeArray removeObjectAtIndex:0];
        //рекурсивно начинаем создавать ветки для вышеуказанного корня, начиная с левой ветки
        root.left = [root createTree:treeArray andLevel:root.level + 1];
        //как только по левой ветке все дочерние ветки заканчиваются, создаем правую ветку
        root.right = [root createTree:treeArray andLevel:root.level + 1];
        
        return root;
    }
}

- (void)returnNodesArray: (NSMutableDictionary **)dict{
    NSMutableDictionary *mutDict = *dict;
    NSString *key = [[NSString alloc] initWithFormat:@"%d", self.level];
    if (mutDict[key]){
        [mutDict[key] addObject:self.value];
    }else{
        mutDict[key] = [[NSMutableArray alloc] initWithObjects:self.value, nil];
    }
    
    if( self.left != nil){
        [self.left returnNodesArray:dict];
    }
    if(self.right != nil){
        [self.right returnNodesArray:dict];
        
    }
}


@end
