# Ruby arithmetic calculator

A basic arithmetic calculator implemented in Ruby

### Consists of:

- Lexer (converts input string to array of tokens)
- Parser (converts array of tokens to [RPN](https://en.wikipedia.org/wiki/Reverse_Polish_notation))
- Evaluator (evaluates RPN expression)

### Supports following arithmetic operations:

- `+` (addition)
- `-` (subtraction)
- `/ `(division)
- `*` (multiplication)
- `^` (exponentiation)
- `log` (taking the logarithm)

### Usage:

```bash
ruby app.rb [expression]
```

### Example:

```bash
ruby app.rb "log(10, 100) * ((4 - 7) ^ (3 + 1) / 4)"
```
