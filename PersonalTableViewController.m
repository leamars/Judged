//
//  PersonalTableViewController.m
//  Judged
//
//  Created by Lea Marolt on 1/9/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "PersonalTableViewController.h"
#import "Person.h"
#import "PersonCell.h"

@interface PersonalTableViewController () {
    NSMutableDictionary *people;
    NSArray *peopleNames;
    int tag;
    Person *currentPerson;
    int currentLoses;
    int currentLoves;
}

@end

@implementation PersonalTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *peoplePic = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"P1"], [UIImage imageNamed:@"P2"], [UIImage imageNamed:@"P3"], nil];
    NSArray *judgedPic = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"], nil];
    peopleNames = @[@"Martina Marolt", @"Lea Marolt", @"Nilob Naihd"];
    NSArray *comments = @[@"This place. Yay or nay?", @"Should I buy this dress?", @"Thinking of buying this place..."];
    people = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < [peopleNames count]; i++) {
        Person *person = [Person personWithName:peopleNames[i] Comment:comments[i] ProfilePic:peoplePic[i] JudgedPic:judgedPic[i]];
        [people setObject:person forKey:person.name];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *name = [peopleNames objectAtIndex:indexPath.row];
    Person *person = [people objectForKey:name];
    
    if(cell == nil)
    {
        cell = [[PersonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.nameLabel.text = person.name;
    cell.profileImg.image = person.profilePic;
    cell.judgedImg.image = person.judgedPic;
    cell.judgedLabel.text = [NSString stringWithFormat:@"%i", person.judged];
    
    [cell.loveButton addTarget:self action:@selector(loveMore:) forControlEvents:UIControlEventTouchUpInside];
    [cell.loseButton addTarget:self action:@selector(loseMore:) forControlEvents:UIControlEventTouchUpInside];
    cell.loveNum.text = [NSString stringWithFormat:@"%i", person.loves];
    cell.loseNum.text = [NSString stringWithFormat:@"%i", person.loses];
    
    return cell;
}

- (IBAction)loveMore:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSLog(@"after button?");
    
    PersonCell *cell = [self parentCellForView:btn];
    Person *person = [people objectForKey:cell.nameLabel.text];
    person.loves++;
    [self.tableView reloadData];
}

- (IBAction)loseMore:(id)sender {
    UIButton *btn = (UIButton *)sender;
    PersonCell *cell = [self parentCellForView:btn];
    Person *person = [people objectForKey:cell.nameLabel.text];
    person.loses++;
    [self.tableView reloadData];
}

-(PersonCell *)parentCellForView:(id)theView
{
    id viewSuperView = [theView superview];
    while (viewSuperView != nil) {
        if ([viewSuperView isKindOfClass:[PersonCell class]]) {
            return (PersonCell *)viewSuperView;
        }
        else {
            viewSuperView = [viewSuperView superview];
        }
    }
    return nil;
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
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
