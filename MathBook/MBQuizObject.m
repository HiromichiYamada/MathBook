//
//  MBQuizObject.m
//  MathBook
//

#import "MBQuizObject.h"

// 1 + 2 という問題を定義するクラス.
// 足し算の他にも持ちたいけど、今日は時間がないので、足し算ONLY。
@implementation MBQuizObject
{
	int firstNumber;	// 左の数
	int secondNumber;	// 右の数.
}

- (void) createQuiz
{
	// 二つの数をランダムに決定.
	firstNumber	= rand()%100;
	secondNumber = rand()%100;
	// rand() .. 乱数を生成.
	// rand()%100 .. 乱数を100で割った余り（つまり、0〜99の範囲の乱数）
}

- (NSString*) question
{	// 問題文.
	return [NSString stringWithFormat:@"%d + %d", firstNumber, secondNumber];
}

- (NSString*) answer
{	// 正答.
	int resultNumber = firstNumber + secondNumber;
	return [NSString stringWithFormat:@"%d", resultNumber];
}


@end
