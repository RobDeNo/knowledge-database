https://jqplay.org/
https://docs.jsonata.org/simple
```json
$ curl cheat.sh/

 cheat.sheets:jq 
# jq
# A lightweight and flexible command-line JSON processor.

# Output a JSON file, in pretty-print format:
jq

# Output all elements from arrays
# (or all key-value pairs from objects) in a JSON file:
jq .[]

# Read JSON objects from a file into an array, and output it
# (inverse of jq .[]):
jq --slurp

# Output the first element in a JSON file:
jq .[0]

# Output the value of a given key of the first element in a JSON file:
jq .[0].key_name

# Output the value of a given key of each element in a JSON file:
jq 'map(.key_name)'
#
#     [ { foo: 1 }, { foo: 2 } ]
#     => [1, 2]

# Extract as stream of values instead of a list
jq '.[] | .foo'
#
#     [ { "foo": 1 }, { "foo": 2 } ]
#     => 1, 2

# Slicing
jq '.[1:2]'
#
#     [ { "foo": 1 }, { "foo": 2 } ]
#     => { "foo": 2 }

# Dictionary subset shorthand
jq 'map({ a, b })'
#
#     [ { "a": 1, "b": 2, "c": 3 }, ...]
#     => [ { "a": 1, "b": 2 }, ...]

# Converting arbitrary data to json
jq -r '(map(keys) | add | unique | sort) as $cols \
        | .[] as $row | $cols | map($row[.]) | @csv'
#
#     [ { "foo": 1, "bar": 2}, { "foo": 3, "baz": 4}]
#
#     => 2,,1
#      ,4,3

# Filter a list of objects
jq 'map(select(.name == "foo"))'
#
#     [ { "name": "foo" }, { "name": "bar" } ]
#     => [ { "name": "foo" } ]

#
#     ## mapping and transforming ##
#

# Add + 1 to all items
jq 'map(.+1)'

# Delete 2 items
jq 'del(.[1, 2])'

# Concatenate arrays
jq 'add'

# Flatten an array
jq 'flatten'
#
#     [[1], [2]]
#     => [1, 2]

# Create a range of numbers
jq '[range(2;4)]'

# Display the type of each item
jq 'map(type)'

# Sort an array of basic type
jq 'sort'
#
#     [3, 2, 1]
#     => [1, 2, 3]

# Sort an array of objects
jq 'sort_by(.foo)'

# Sort lines of a file
jq --slurp '. | sort | .[]'

# Group by a key - opposite to flatten
jq 'group_by(.foo)'

# Minimum value of an array
jq 'min'
# See also min, max, min_by(path_exp), max_by(path_exp)

# Remove duplicates
jq 'unique'
# or
jq 'unique_by(.foo)'
# or
jq 'unique_by(length)'
#
#   [1, 1, 2, 1]
#   => [1, 2]

# Reverse an array
jq 'reverse'

#
#   ## jq in shell scripts ##
#

# URL Encode something
date | jq -sRr @uri
# Thu%2021%20May%202020%2012%3A40%3A40%20PM%20CEST%0A

# To create proper JSON from a shell script and properly escape variables:
jq -n --arg foobaz "$FOOBAZ" '{"foobaz":$foobaz}'

# To fill environment variables from JSON object keys
# (e.g. $FOO from jq query ".foo")
export $(jq -r '@sh "FOO=\(.foo) BAZ=\(.baz)"')


#
#   ## Input/output formats ##
#

# Parsing json
jq 'with_entries(.value |= fromjson)' --sort-keys
#
#     { "b": "{}", "a": "{}" }
#     =>  { "a": {}, "b": {} }

# Serializing json
#
jq 'with_entries(.value |= tojson)' --sort-keys
#
#     { "a": {}, "b": {} }
#     => { "a": "{}", "b": "{}" }

# Converting to csv
jq '.[] | [.foo, .bar] | @csv' -r
#
#     [{ "foo": 1, "bar": 2, "baz":3 }]
#     => 1,2

 cheat:jq 
# To pretty print the json:
jq "." < filename.json

# To access the value at key "foo":
jq '.foo'

# To access first list item:
jq '.[0]'

# to slice and dice:
jq '.[2:4]'
jq '.[:3]'
jq '.[-2:]'

# to extract all keys from json:
jq keys

# to sort by a key:
jq '.foo | sort_by(.bar)'

# to count elements:
jq '.foo | length'

# print only selected fields:
jq '.foo[] | {field_1,field_2}'

# print selected fields as text instead of json:
jq '.foo[] | {field_1,field_2} | join(" ")'

# only print records where given field matches a value
jq '.foo[] | select(.field_1 == "value_1")'

 tldr:jq 
# jq
# A command-line JSON processor that uses a domain-specific language.
# More information: <https://stedolan.github.io/jq/manual/>.

# Execute a specific expression (print a colored and formatted json):
cat path/to/file.json | jq '.'

# Execute a specific script:
cat path/to/file.json | jq --from-file path/to/script.jq

# Pass specific arguments:
cat path/to/file.json | jq --arg "name1" "value1" --arg "name2" "value2" ... '. + $ARGS.named'

# Print specific keys:
cat path/to/file.json | jq '.key1, .key2, ...'

# Print specific array items:
cat path/to/file.json | jq '.[index1], .[index2], ...'

# Print all array items/object keys:
cat path/to/file.json | jq '.[]'

# Add/remove specific keys:
cat path/to/file.json | jq '. +|- {"key1": "value1", "key2": "value2", ...}'

$
```
Follow @igor_chubin 