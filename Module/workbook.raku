   use XLSX::Writer;

    my $workbook = XLSX::Writer::Workbook.new("/path/to/somewhere.xlsx");
    my $worksheet = $workbook.add-worksheet("Sheeeeeeeeet");

    $worksheet.write-value(0, 0, "Hello");
    $worksheet.write-value(0, 1, pi);
    $worksheet.write-value(0, 2, True);
    $worksheet.write-value(0, 3, DateTime.now);
    $worksheet.write-value(0, 4, "http://modules.perl6.org/", :url);
    $worksheet.write-formula(0, 5, "=B1*2", :result(2*pi));

    my $bold-format = $worksheet.add-format();
    $bold-format.set-bold();
    $worksheet.write-value(0, 6, "A bold greeting", $bold-format);

    $workbook.close();