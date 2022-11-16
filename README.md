cucumber-browserstack
=====================

This repository provides information and helpful tweaks to run your Cucumber tests on the BrowserStack selenium cloud infrastructure.

### Configuration
Add the Cucumber gems into your Gemfile.
Run `bundle install`.

if any error occurs with respect to bundler, then run `bundle update --bundler`

### Run tests
To run the tests, execute:

```bash
cucumber features/ --tags @<tag_name> username=<username> accesskey=<access-key> remote=true -f pretty -f junit -o ./reports/report_xml -f pretty -f html -o ./reports/report_html.html
```

Alternatively the variables can be set in the environment using env or your CI framework (like Travis or Jenkins)

### Further Reading
- [Cucumber](https://cucumber.io/)
- [BrowserStack documentation for Automate](https://www.browserstack.com/automate/ruby)

Happy Testing!


