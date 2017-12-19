[![Build Status](https://travis-ci.org/codedge-llc/accessible.svg?branch=master)](https://travis-ci.org/codedge-llc/accessible)
[![Hex.pm](http://img.shields.io/hexpm/v/accessible.svg)](https://hex.pm/packages/accessible) [![Hex.pm](http://img.shields.io/hexpm/dt/accessible.svg)](https://hex.pm/packages/accessible)

# Accessible

Dead-simple Access behaviour for custom structs

## Installation

Add accessible as a `mix.exs` dependency:

```elixir
def deps do
  [
    {:accessible, "~> 0.1.0"}
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
