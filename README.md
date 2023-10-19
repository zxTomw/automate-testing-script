# automate-testing-script
Automates the I/O testing of a program
# Run Tests
Assume you have an executable `<program>` that takes input from stdin and outputs to stdout. In the same directory you have test cases named `<testNames>.in` and expected output files `<testNames>.out`, where test names are logged in a file `<suiteName>.txt`. Then you can run 
```shell
./runSuite.sh
```
to generate results of testing your executable against your test cases.
