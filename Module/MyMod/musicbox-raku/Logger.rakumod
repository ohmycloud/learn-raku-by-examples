
use Constant;

constant FILE_NAME = Constant.log_path;

my $fh = open :a, FILE_NAME;
$fh.say: '#' x 80;
$fh.say: "\n";
$fh.close;

sub getLogger($name):
    log = logging.getLogger($name)
    log.setLevel(logging.DEBUG)

    # File output handler
    fh = logging.FileHandler(FILE_NAME)
    fh.setLevel(logging.DEBUG)
    fh.setFormatter(
        logging.Formatter(
            "%(asctime)s - %(levelname)s - %(name)s:%(lineno)s: %(message)s"
        )
    )
    log.addHandler(fh)

    return log
