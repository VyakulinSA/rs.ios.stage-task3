#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; //создаем форматтер
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:4]; //настраиваем тайм зону, чтобы небыло смещения по времени и датам
    [formatter setDateFormat:@"M"]; //настраиваем форматтер, чтобы мог принять дату в виде одного числа месяца
    NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%lu", (unsigned long)monthNumber]]; //создаем дату через форматер и передаем номер месяца
    [formatter setDateFormat:@"MMMM"];//меняем у форматера представление даты
    
    return [formatter stringFromDate:date]; //возвращаем обратно дату текстом
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; //создаем форматтер
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"]; //указываем формат строки с датой, которую будем переводить в дату
    NSDate *aDate = [formatter dateFromString:date]; //создаем дату
    NSCalendar *calendar = [NSCalendar currentCalendar]; //создаем календарь текущий
    
    return [calendar component:NSCalendarUnitDay fromDate:aDate]; //получаем по текущей дате календарный день
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [formatter setDateFormat:@"EE"];

    return [formatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar]; //создаем текущий календарь
    NSInteger todaysWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]]; //получаем номер недели из этого года для текущей даты
    NSInteger dateWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date]; //получаем номер недели в текущем году для переданной даты

    return dateWeek == todaysWeek ? YES : NO; //если равны, значит дата лежит в текущей неделе
}

@end
