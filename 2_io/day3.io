" 1. Enhance the XML porgram to indent with spaces" println

Builder := Object clone;
Builder indent := 0;

Builder spaces := method(i, "  " repeated(i))

Builder forward := method(
    indent = indent + 1
    writeln(spaces(indent), "<", call message name, ">")
    call message arguments foreach(
        arg, content := self doMessage(arg)
        if (content type == "Sequence", writeln(spaces(indent + 1), content))
    )
    writeln(spaces(indent), "</", call message name, ">")
    indent = indent - 1
)

Builder ul(li(span("Io")), li("Test"), li("indent"))

"\n 2. Create a list syntax that uses brackets" println

Object squareBrackets := method(call message arguments);

[1,2,3] println

[1] type println

List squareBrackets := method(index, self at(index))

[1,2,3][1] println

"\n 3. Expand Builder to use curly brackets to write attributes" println

# Expand Builder with attribute syntax

# copy curly brace function from book

OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg, r doMessage(arg))
  r
)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder forward := method(
  write(spaces(indent), "<", call message name);
  attributes := call message arguments first;
  if (attributes != nil,
    map := doMessage(attributes);
    if (map type == "Map", map foreach(key, value, write(" ", key, "=\"",value, "\"")))
  );
  writeln(">")
  indent = indent + 1
  call message arguments foreach(
    arg,
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(spaces(indent), content))
  )
  indent = indent - 1
  writeln(spaces(indent), "</", call message name, ">")
)

doString("Builder ul({\"id\":\"myul\"}, li({\"class\":\"aaa\", \"id\":\"a\"}, \"AAAA\"), li(\"BBBB\"), li(\"CCCC\"))")





