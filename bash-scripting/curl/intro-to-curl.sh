#!/bin/bash

# Most Commonly Used Options
# -o or --output: Specifies the output file to write the response to. For example:
curl -o output.txt https://google.com

# -X: Specifies a custom request method to use when communicating with the HTTP server. For example:
curl -X POST https://google.com

# -H: Adds an extra header to the request. This is useful for setting custom headers, such as Content-Type or Authorization. For example:
curl -H "Content-Type: application/json" http://google.com