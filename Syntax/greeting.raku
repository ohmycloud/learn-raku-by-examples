class Person {
    has Str  $.username;
    has Str  $.name;
    has Str  $.email;
    has Str  %.social{Str};
    has List %.skills{Str};

    method greeting(--> Str) {
        "Hi, I'm $!name. Nice to meet you!";
    }
}

my $aaron = Person.new(
    username => 'aaronreidsmith',
    name     => 'Aaron Smith',
    email    => 'aaronreidsmith@gmail.com',
    social => (
        'linkedin'       => 'https://www.linkedin.com/in/aaronreidsmith/',
        'github'         => 'https://github.com/aaronreidsmith',
        'stack-overflow' => 'https://stackoverflow.com/users/10696164/aaron-smith'
    ),
    skills => (
        'languages'       => ('Scala', 'Python', 'SQL', 'Java', 'Bash', 'Raku', 'R', 'Perl', 'PHP'),
        'big-data'        => ('Kafka', 'Spark', 'Databricks', 'Kinesis', 'Hadoop', 'Zookeeper', 'Hive', 'Pig'),
        'databases'       => ('Snowflake', 'Redshift', 'MySQL', 'PostgreSQL', 'DynamoDB'),
        'ci-cd'           => ('Azure Pipelines', 'GitHub Actions', 'Jenkins', 'Travis CI', 'Appveyor', 'CircleCI'),
        'cloud-platforms' => ('Amazon Web Services', 'Google Cloud Platform')
    )
);
say $aaron.greeting();
# Hi, I'm Aaron Smith. Nice to meet you!
