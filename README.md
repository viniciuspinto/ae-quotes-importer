AE Quotes Importer
==================

Parse and import daily stock quotes from Agência Estado's .csv files into a database (tested with MySQL).

Some companies listed on Bovespa, like Bradesco and Petrobrás, provide access to adjusted historical quotes in the form of .csv files. These files can be downloaded in their Investor Relations sites.

**DB Setup**

Edit the database connection info on `db/config.yml`.

You can either use your existing tables (as long as they have the correct schema) or create them with:

    rake db:create
    rake db:migrate

**Testing:**

    rake db:test:prepare
    rake test:rspec

**Usage**

Creating a stock:

    ae_quotes_importer create_stock STOCK_CODE [STOCK_NAME [STOCKS_TABLE]]

    * The default table name is `stocks`. If you don't provide the stock name, the code will be used.

    Examples:
              ae_quotes_importer create_stock PETR4
              ae_quotes_importer create_stock BBDC4 "BCO BRADESCO" my_stocks_table


Importing quotes from a .csv file:

    ae_quotes_importer import_quotes STOCK_CODE CSV_FILE_PATH [QUOTES_TABLE]

    * The default table name is `ae_quotes`

    Examples:
              ae_quotes_importer import_quotes PETR4 petr4.csv
              ae_quotes_importer import_quotes BBDC4 ~/stocks/bradesco.csv my_quotes_table

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

