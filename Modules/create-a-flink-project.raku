#!/usr/bin/env perl6

my $groupId = prompt("请输入 groupId: ");
my $artifactId = prompt("请输入 artifactId: ");
my $package = prompt("请输入 package 名: ");

say qqx/
mvn archetype:generate \\
    -DarchetypeGroupId=org.apache.flink \\
    -DarchetypeArtifactId=flink-walkthrough-datastream-scala \\
    -DarchetypeVersion=1.11.1 \\
    -DgroupId=$groupId \\
    -DartifactId=$artifactId \\
    -Dversion=0.1 \\
    -Dpackage=$package \\
    -DinteractiveMode=false
/;