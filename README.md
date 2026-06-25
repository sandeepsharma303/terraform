terraform console
| Category            | Function       | Example                                 | Output                                                     |
| ------------------- | -------------- | --------------------------------------- | ---------------------------------------------------------- |
| **String**          | `upper()`      | `upper("sandeep")`                      | `"SANDEEP"`                                                |
|                     | `lower()`      | `lower("SANDEEP")`                      | `"sandeep"`                                                |
|                     | `trim()`       | `trim(" sandeep ", " ")`                | `"sandeep"`                                                |
|                     |                | `trim("sandeep","san")`                 | `"deep"` *(removes characters `s`,`a`,`n` from both ends)* |
|                     | `replace()`    | `replace("hello world"," ","-")`        | `"hello-world"`                                            |
|                     | `substr()`     | `substr("hello",0,3)`                   | `"hel"`                                                    |
|                     | `split()`      | `split(",", "red,green,blue")`          | `["red","green","blue"]`                                   |
|                     | `join()`       | `join("-",["dev","web","01"])`          | `"dev-web-01"`                                             |
| **Numeric**         | `max()`        | `max(5,12)`                             | `12`                                                       |
|                     | `min()`        | `min(1,2,3)`                            | `1`                                                        |
|                     | `sum()`        | `sum([2,3])`                            | `5`                                                        |
| **Collection**      | `length()`     | `length([1,2,3])`                       | `3`                                                        |
|                     | `concat()`     | `concat([1,2],[3,4])`                   | `[1,2,3,4]`                                                |
|                     | `distinct()`   | `distinct(["a","b","a"])`               | `["a","b"]`                                                |
|                     | `reverse()`    | `reverse([1,2,3])`                      | `[3,2,1]`                                                  |
|                     | `element()`    | `element(["a","b","c"],1)`              | `"b"`                                                      |
|                     | `toset()`      | `toset(["a","b","a"])`                  | `toset(["a","b"])`                                         |
| **Map**             | `merge()`      | `merge({a=1},{b=2})`                    | `{a=1,b=2}`                                                |
|                     | `lookup()`     | `lookup({env="dev"},"env","default")`   | `"dev"`                                                    |
|                     | `zipmap()`     | `zipmap(["Name","Age"],["Sandeep",24])` | `{Name="Sandeep",Age=24}`                                  |
| **Type Conversion** | `tonumber()`   | `tonumber("23")`                        | `23`                                                       |
|                     | `tostring()`   | `tostring(23)`                          | `"23"`                                                     |
| **Date & Time**     | `timestamp()`  | `timestamp()`                           | `"2026-06-26T12:30:45Z"` *(example)*                       |
|                     | `formatdate()` | `formatdate("DD-MM-YYYY", timestamp())` | `"26-06-2026"` *(example)*                                 |
| **Encoding**        | `jsonencode()` | `jsonencode({name="Sandeep",age=24})`   | `{"name":"Sandeep","age":24}`                              |
|                     | `jsondecode()` | `jsondecode("{\"name\":\"Sandeep\"}")`  | `{name="Sandeep"}`                                         |
| Function        | Purpose                                      | Example                          | Output                          |
| --------------- | -------------------------------------------- | -------------------------------- | ------------------------------- |
| `cidrhost()`    | Returns a specific host IP from a CIDR block | `cidrhost("10.0.0.0/24",10)`     | `10.0.0.10`                     |
| `cidrsubnet()`  | Creates one subnet from a network            | `cidrsubnet("10.0.0.0/16",8,1)`  | `10.0.1.0/24`                   |
| `cidrsubnets()` | Creates multiple subnets at once             | `cidrsubnets("10.0.0.0/16",8,8)` | `["10.0.0.0/24","10.0.1.0/24"]` |
| `cidrnetmask()` | Returns the subnet mask                      | `cidrnetmask("10.0.0.0/24")`     | `255.255.255.0`                 |

