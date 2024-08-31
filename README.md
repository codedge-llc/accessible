# Accessible

> Dead-simple Access behaviour for custom structs

[![CI](https://github.com/codedge-llc/accessible/actions/workflows/ci.yml/badge.svg)](https://github.com/codedge-llc/accessible/actions/workflows/ci.yml)
[![Version](https://img.shields.io/hexpm/v/accessible.svg)](https://hex.pm/packages/accessible)
[![Total Downloads](https://img.shields.io/hexpm/dt/accessible.svg)](https://hex.pm/packages/accessible)
[![License](https://img.shields.io/hexpm/l/accessible.svg)](https://github.com/codedge-llc/accessible/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/codedge-llc/accessible.svg)](https://github.com/codedge-llc/accessible/commits/master)
[![Documentation](https://img.shields.io/badge/documentation-gray)](https://hexdocs.pm/accessible/)

## Installation

Add accessible as a `mix.exs` dependency:

```elixir
def deps do
  [
    {:accessible, "~> 0.3.0"}
  ]
end
```

## Usage

Add `use Accessible` to your struct's module to enable `Access` behavior.

```elixir
defmodule YourModule
  defstruct key: 1234, key_2: true

  use Accessible

  def your_function do
  ...
end
```

Your struct can now use all of the features of Access, including `struct[:key]` access syntax and Kernel nested get/update functions.

```elixir
iex> %YourModule{}[:key]
1234
```

## Contributing

### Testing

Unit tests can be run with `mix test`.

### Formatting

This project uses Elixir's `mix format` and [Prettier](https://prettier.io) for formatting.
Add hooks in your editor of choice to run it after a save. Be sure it respects this project's
`.formatter.exs`.

### Commits

Git commit subjects use the [Karma style](http://karma-runner.github.io/5.0/dev/git-commit-msg.html).

## License

Copyright (c) 2017-2024 Codedge LLC (https://www.codedge.io/)

This library is MIT licensed. See the [LICENSE](https://github.com/codedge-llc/accessible/blob/master/LICENSE) for details.
