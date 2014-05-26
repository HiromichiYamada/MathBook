//
//  MBQuizListViewController.m
//  MathBook
//
//  Created by 山田 宏道 on 2014/05/24.
//  Copyright (c) 2014年 Torques Inc. All rights reserved.
//

#import "MBQuizListViewController.h"

#import "MBQuizObject.h"


@interface MBQuizListViewController ()

@end


@implementation MBQuizListViewController
{
//	NSArray *quizList;
	NSMutableArray *quizList;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// 問題初期化.
	/*
	quizList	= @[ @"あいうえお",
								 @"２",
								 @"３",
								 @"４",
								 @"５" ];
	 */
	
//	quizList = [[NSMutableArray alloc] init]; // これと同じ↓
	quizList = [NSMutableArray array];
	
	for (int i=0; i<50; i++) {
    MBQuizObject * quiz = [[MBQuizObject alloc] init];
		[quiz createQuiz];
		[quizList addObject:quiz];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	/*
	switch (section) {
		case 0:
			return 30;
		case 1:
			return 20;
	}
	return 0;
	 */
	return [quizList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	indexPath.section;
//	indexPath.row;
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuizCell" forIndexPath:indexPath];
	
//	cell.textLabel.text	= @"出来たかな？";
	
//	cell.textLabel.text	= [NSString stringWithFormat:@"セクション %d の %d 行目",
//												 indexPath.section,
//												 indexPath.row];
	
//	cell.textLabel.text = quizList[indexPath.row];	// 中身が文字列の場合.
	
	// 問題データを抽出.
	MBQuizObject * quiz = quizList[indexPath.row];
	cell.textLabel.text = [quiz question];
	
	return cell;
}

- (void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	MBQuizObject * quiz = quizList[indexPath.row];
	
	UIAlertView * alert
	= [[UIAlertView alloc] initWithTitle:@"タイトル"
															 message:[quiz answer]	//@"メッセージ"
															delegate:nil
										 cancelButtonTitle:@"OK"
										 otherButtonTitles:nil];
	[alert show];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
