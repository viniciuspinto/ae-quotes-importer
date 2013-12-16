ae-quotes-importer
==================

Parse and import daily stock quotes from Agência Estado's .csv files into a database (tested with MySQL).

Some companies listed on Bovespa, like Bradesco and Petrobrás, provide access to adjusted historical quotes in the form of .csv files. These files can be downloaded in their Investor Relations sites.

**DB setup:**

    rake db:create
    rake db:migrate

**Testing:**

    rake db:migrate DB=test
    rake test:rspec

**Provided tasks:**

    # Create a stock
    ruby tasks/create_stock.rb STOCK_CODE STOCK_NAME

    # Import a .csv file (downloaded from AE)
    ruby tasks/import_ae_quotes.rb (STOCK_CODE | STOCK_ID) QUOTES_FILE_PATH

**License:**

The MIT License (MIT)

Copyright (c) 2013 Vinicius Pinto

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

