#!/usr/bin/local/perl -w 
use Tk;
use DBI;
use strict;
my $mw = new MainWindow;
$mw->geometry("1200x1200"); 
my $mwtitle_font = $mw->fontCreate('font1', -family => 'Times New Roman',-size => 22);
my $mwheading_font = $mw->fontCreate('font2', -family => 'Times New Roman',-size => 18);
my $mwtext_font = $mw->fontCreate('font3', -family => 'Times New Roman',-size => 12);
my $driver = "mysql";
my $database = "BOOK_STORE";
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = "deepi";
my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
$mw->configure(-background=>'blue',-foreground=>'white');
$mw->Frame(-background => 'blue')->pack(-ipadx =>50,-side=>"left",-fill =>"y");
$mw->Frame(-background => 'blue')->pack(-ipadx =>50,-side=>"right",-fill=>"y");
my $maintitle=$mw->Label(-text=>"BOOK STORE",-font=>$mwtitle_font)->place(-x => 500,-y =>60);
my $mainb=$mw->Button(-text => "Log In",-command=>\& Account,-font=>$mwtext_font)->place(-x => 550,-y => 200);
my $userb=$mw->Button(-text => "Register",-command=>sub{
my $userwind=$mw->Toplevel();
my $ti_font = $userwind->fontCreate('font4', -family => 'Times New Roman', -size => 22);
my $h_font = $userwind->fontCreate('font5', -family => 'Times New Roman',-size => 18);
my $t_font = $userwind->fontCreate('font6', -family => 'Times New Roman', -size => 13);
$userwind->Label(-text=>"*",-foreground=>"red",-font=>$t_font)->place(-x=>27,-y=>70);
my $userid = $userwind -> Label(-text=>"User Id:",-font=>$t_font);
my $ent = $userwind-> Entry();
 $userwind->Label(-text=>"*",-foreground=>"red",-font=>$t_font)->place(-x=>28,-y=>95);
my $username = $userwind -> Label(-text=>"User Name:",-font=>$t_font);
my $ent1 =$userwind -> Entry();
$userwind->Label(-text=>"*",-foreground=>"red",-font=>$t_font)->place(-x=>10,-y=>152);
my $userpwd = $userwind -> Label(-text=>"Password:",-font=>$t_font);
my $ent2 = $userwind -> Entry();
 $userwind->Label(-text=>"*",-foreground=>"red",-font=>$t_font)->place(-x=>42,-y=>178);
my $mailid = $userwind-> Label(-text=>"Mailid:",-font=>$t_font);
my $ent3 = $userwind -> Entry();
$userwind->Label(-text=>"*",-foreground=>"red",-font=>$t_font)->place(-x=>28,-y=>206);
my $addressl = $userwind -> Label(-text=>"Address:",-font=>$t_font);
my $address=$userwind -> Label(-height =>5,-width=>40,-wrap => 'word');
my $ent4 = $userwind-> Entry();
$userwind->Label(-text=>"*",-foreground=>"red",-font=>$t_font)->place(-x=>32,-y=>263);
my $lab5 = $userwind -> Label(-text=>"
obile Number:",-font=>$t_font);
my $ent5 = $userwind -> Entry();
my $but =$userwind->Button(-text => "Submit",-command =>sub{
$userid->grid(-row1,-columns=>5);
my $ud=$ent->get();
my $un=$ent1->get();
my $pass=$ent2->get();
my $mid=$ent3->get();
my $add=$ent4->get();
my $pno=$ent5->get();
my $sth = $dbh ->prepare("INSERT INTO User (uid, uname,password,mailid,address,phno)
                values(?,?,?,?,?,?) ");
$sth ->execute($ud,$un,$pass,$mid,$add,$pno )
        or die  $DBI::errstr;
$sth->finish();
printf "Inserted";
$mw->messageBox(-message=>"Registered Successfully!! Log In");
my $buttonl=$userwind->Button(-text=>"Login",-command=>\&Account)->pack();
my $s1th = $dbh ->prepare("Select * from User");
$s1th ->execute() or die $DBI::errstr;
print "Number of rows dounf:" + $s1th->rows;
while (my @row = $s1th->fetchrow_array()){
        my ($ud, $un ) = @row ;
        print "User Name = $un, User Id = $ud\n";
}
$s1th->finish();
});
$but->pack();
},-font=>$mwtext_font)->place(-x => 200,-y => 250);
$userb->pack();
MainLoop;
sub Account{
my $login=$mw->Toplevel();
$login->title("Login");
$login->geometry("800x800");
my $llabel=$login ->Label(-text=>"User name",-width=>20)->pack(-side=>"top");
my $euser=$login->Entry(-width=>20,-background=>'white',-foreground=>'black') ->pack (-side=>"top");
my $luid=$login ->Label(-text=>"Password",-width=>20)->pack(-side=>"top");
my $luentry=$login ->Entry(-width=>20,-background=>'white',-foreground=>'black')->pack(-side=>"top");
my $okb =$login ->Button(-text=>"Ok",-command=>sub{
my $useruid=$euser->get();
print "$useruid";
my $userpwd = $dbh ->selectrow_array("Select password from User where uid='$useruid'");
my $passlogin=$luentry->get();
print "------------------------";
print "$passlogin";
print "------------------------";
print "$userpwd";
if($passlogin eq $userpwd)
{
my $ta = $mw->Toplevel();
$ta->title("Search Region");
$ta->geometry("800x800");
my $but1=$ta -> Button(-text => "Search by Author",-command =>sub 
		{
			my $lab6=$ta->Label(-text=>"Enter Author name",-width=>20) -> pack(-side=>"top");
			my $ent6=$ta->Entry(-width=>20,-background=>'white',-foreground=>'black') -> pack(-side => "top");
my $saname=$ta->Button(-text => "Ok",-command => sub 
			{
				my $aname=$ent6->get();
				print "Author name is $aname" ;
				my $sa=$mw->Toplevel();
				$sa->geometry("800x800");
				print "$aname";
				my $sth =$dbh -> prepare("select bid,BOOK.bookname,priceb,edition,authorname,Publication.pid,pname,address,phno from BOOK,Author,Publication where BOOK.pid=Publication.pid and BOOK.aid in(select aid from Author where authorname='$aname')");
				$sth ->execute() or die $DBI::errstr;
				print "Number of rows :" + $sth->rows;
				while(my @row = $sth -> fetchrow_array())
				{
					my ($a,$b,$c,$d,$e,$f,$g,$h,$i)= @row;
					print "Bid is=$a,Bookname=$b,Price =$c,Edition=$d,Author Name=$e,Publication Id=$f\n"; 
				}
				$sth->finish();
my $sbb=$ta->Button(-text=>"Search by Book Name",-command =>sub{
		my $lbname=$ta->Label(-text=>"Enter the Book name:",-width=>20) ->pack(-side=>"top");
		my $ebname=$ta->Entry(-width=>20,-background=>'white',-foreground=>'black')->pack(-side=>"top");
	my $sbname=$ta->Button(-text => "Ok",-command => sub  
                        {
                                my $bbname=$ebname->get();
                                print "Book  name is $bbname" ;
                                my $sa1=$mw->Toplevel();
                                $sa1->geometry("800x800");
                                my $sth =$dbh -> prepare("select bid,BOOK.bookname,BOOK.aid,authorname,BOOK.pid,pname,address,phno from BOOK,Author,Publication where BOOK.pid=Publication.pid and  BOOK.bookname in(select bookname from BOOK where bookname='$bbname')");
                                $sth ->execute() or die $DBI::errstr;
                                print "Number of rows :" + $sth->rows;
                                while(my @row = $sth -> fetchrow_array()) 
                                {
                                        my ($a,$b)= @row;
                                        print "Bid is=$a,Bookname=$b\n";
                                }
	$sth->finish();
});
$sbname->pack();
});
$sbb->pack();
});
$saname->pack();
});
$but1->pack();
}
else
{
$login-> messageBox(-message=>"Incorrect Password!!Try Again");
$login-> destroy;
Account();
}
});
$okb->pack();
}	

